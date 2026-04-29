import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/core.dart';

class AddTicketDialog extends StatelessWidget {
  const AddTicketDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final criteria = ['single', 'group'];
    final category = ['berenang', 'zoo', 'museum'];

    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final categoryNotifier = ValueNotifier(category.first);
    final criteriaNotifier = ValueNotifier(criteria.first);

    int parseCurrency(String text) =>
        int.tryParse(text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

    priceController.text = parseCurrency(priceController.text).currencyFormatRp;

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            SpaceHeight(8),
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
            ValueListenableBuilder<String>(
              valueListenable: categoryNotifier,
              builder: (context, value, _) {
                return CustomDropdown(
                  value: value,
                  items: category,
                  label: 'Kategori Tiket',
                  onChanged: (value) => categoryNotifier.value = value!,
                );
              },
            ),
            SpaceHeight(8),
            ValueListenableBuilder<String>(
              valueListenable: criteriaNotifier,
              builder: (context, value, _) {
                return CustomDropdown(
                  value: value,
                  items: criteria,
                  label: 'Kriteria Tiket',
                  onChanged: (value) => criteriaNotifier.value = value!,
                );
              },
            ),
            SpaceHeight(40),
            Row(
              children: [
                Flexible(
                  child: Button.filled(
                    onPressed: () => context.pop(),
                    label: 'Batalkan',
                    borderRadius: 12,
                    color: AppColors.buttonCancel,
                    textColor: AppColors.grey,
                  ),
                ),
                SpaceWidth(12),
                Flexible(
                  child: Button.filled(
                    onPressed: () => context.pop(),
                    label: 'Simpan',
                    borderRadius: 12,
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
