import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/core/extensions/string_ext.dart';
import 'package:ticketing_princes/data/model/response/category_response_model.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';
import 'package:ticketing_princes/presentation/home/bloc/category/category_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/product/product_bloc.dart';

class AddTicketDialog extends StatefulWidget {
  const AddTicketDialog({super.key});

  @override
  State<AddTicketDialog> createState() => _AddTicketDialogState();
}

class _AddTicketDialogState extends State<AddTicketDialog> {
  final criterias = ['single', 'group'];
  final category = ['berenang', 'zoo', 'museum'];

  late final TextEditingController nameController;
  late final TextEditingController priceController;
  late final ValueNotifier<Category?> categoryNotifier;
  late final ValueNotifier<String> criteriaNotifier;
  // Value notifer itu tempat untuk menaruh sesuatu yang baklan berubah
  // Perubahannya direkam sama valuelistenablebuilder

  // Ini tempat untuk nyimpan replace-an
  int parseCurrency(String text) =>
      // Ini untuk replcae biar ngga ada string
      int.tryParse(text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

  @override
  void initState() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    categoryNotifier = ValueNotifier<Category?>(null);
    criteriaNotifier = ValueNotifier<String>('single');

    context.read<CategoryBloc>().add(CategoryEvent.fetch());
    priceController.text = parseCurrency(priceController.text).currencyFormatRp;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    categoryNotifier.dispose();
    criteriaNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pake final biar isi nya gak berubah

    return AlertDialog(
      // Biar ngasih space untuk keyboard
      content: SingleChildScrollView(
        child: Column(
          children: [
            SpaceHeight(8),
            CustomTextField(controller: nameController, label: 'Nama Tiket'),
            SpaceHeight(8),
            CustomTextField(
              controller: priceController,
              label: 'Harga Tiket',
              // Keyboard nya bentuknya angka
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return SizedBox();
                  },
                  success: (categories) {
                    final categoryName = categories
                        .map((category) => category.name)
                        .whereType<String>()
                        .toList();
                    return ValueListenableBuilder(
                      // pertama yang direkam adalah category
                      valueListenable: categoryNotifier,
                      // _ = widget, widget nya itu customdropdown
                      builder: (context, value, _) => CustomDropdown(
                        // value ini isinya data yang ada di database, jadi namanya disesuaikan sama nama yang ada di database
                        value: value?.name,
                        items: categoryName,
                        label: 'Kategori Tiket',
                        onChanged: (value) {
                          final selectedCategory = categories.firstWhere(
                            (category) => category.name == value,
                          );
                          categoryNotifier.value = selectedCategory;
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SpaceHeight(8),
            ValueListenableBuilder(
              valueListenable: criteriaNotifier,
              // builder pasti diisi context
              builder: (context, value, _) => CustomDropdown(
                // value: yang kesimpen di database
                value: value,
                // item = yang muncul di tampilan
                items: criterias,
                label: 'Kriteria Tiket',
                onChanged: (value) => criteriaNotifier.value = value!,
              ),
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
                  child: BlocConsumer<ProductBloc, ProductState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: (product) {
                          context.pop();
                        },
                      );
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        orElse: () {
                          return Button.filled(
                            onPressed: () {
                              final selectedCategory = categoryNotifier.value;
                              final categoryId = selectedCategory?.id;
                              final Product product = Product(
                                name: nameController.text,
                                price: priceController.text.toIntegerFromText,
                                stock: 100,
                                categoryId: categoryId,
                                criteria: criteriaNotifier.value.toLowerCase(),
                              );
                              context.read<ProductBloc>().add(
                                ProductEvent.createTicket(product),
                              );
                            },
                            label: 'Simpan',
                            borderRadius: 12,
                          );
                        },
                      );
                    },
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
