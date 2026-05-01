import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/presentation/home/model/product_model.dart';

class EditTicketDialog extends StatelessWidget {
  final ProductModel itemProduk;

  const EditTicketDialog({super.key, required this.itemProduk});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: itemProduk.namaProduk);

    final priceController = TextEditingController(
      text: itemProduk.hargaProduk.currencyFormatRp,
    );

    int parseCurrency(String text) =>
        int.tryParse(text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

    priceController.text = parseCurrency(priceController.text).currencyFormatRp;

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceHeight(8),
            CustomTextField(controller: nameController, label: 'Nama Tiket'),
            SpaceHeight(8),
            CustomTextField(
              controller: priceController,
              label: 'Harga Tiket',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final parsedValue = parseCurrency(value).currencyFormatRp;

                priceController.value = TextEditingValue(
                  text: parsedValue,
                  selection: TextSelection.collapsed(
                    offset: parsedValue.length,
                  ),
                );
              },
            ),
            SpaceHeight(8),
            Row(
              children: [
                Flexible(
                  child: Button.filled(
                    onPressed: () => context.pop(),
                    label: 'Batalkan',
                    borderRadius: 8,
                    color: AppColors.buttonCancel,
                    textColor: AppColors.grey,
                    height: 44,
                    fontSize: 14,
                  ),
                ),
                SpaceWidth(40),
                Flexible(
                  child: Button.filled(
                    onPressed: () => context.pop(),
                    label: 'Simpan',
                    borderRadius: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
