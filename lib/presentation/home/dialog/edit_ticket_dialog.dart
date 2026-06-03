import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';
import 'package:ticketing_princes/presentation/home/bloc/product/product_bloc.dart';

class EditTicketDialog extends StatelessWidget {
  final Product itemProduk;

  const EditTicketDialog({super.key, required this.itemProduk});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: itemProduk.name);

    final priceController = TextEditingController(
      text: itemProduk.price!.currencyFormatRp,
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
                SpaceWidth(10),
                Flexible(
                  child: Button.filled(
                    onPressed: () {
                      context.read<ProductBloc>().add(
                        ProductEvent.updateTicket(
                          Product(
                            id: itemProduk.id,
                            name: nameController.text,
                            price: parseCurrency(priceController.text),
                          ),
                        ),
                      );
                      context.pop();
                    },
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
