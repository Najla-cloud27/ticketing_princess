import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/extensions.dart';
import 'package:ticketing_princes/presentation/home/bloc/category/category_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/product/product_bloc.dart';
import 'package:ticketing_princes/presentation/home/widget/order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String searchQuery = '';
  int? selectedCategoryId;

  // initState itu sesuatu yang di running sekali saaat halaman dibuka atau dibuat
  @override
  void initState() {
    super.initState();

    // FIX: ambil data dari API/server
    context.read<ProductBloc>().add(ProductEvent.getProducts());

    context.read<CategoryBloc>().add(CategoryEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Penjualan')),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search tickets ...',
                prefixIcon: Icon(Icons.search, color: AppColors.primary),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Category Filter
          Container(
            height: 40,
            margin: EdgeInsets.only(bottom: 12),
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (categories) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: categories.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: FilterChip(
                              selected: selectedCategoryId == null,
                              selectedColor: AppColors.primary.withOpacity(0.2),
                              label: Text('All'),
                              labelStyle: TextStyle(
                                color: selectedCategoryId == null
                                    ? AppColors.primary
                                    : AppColors.black,
                              ),
                              onSelected: (value) {
                                setState(() {
                                  selectedCategoryId = null;
                                });
                              },
                            ),
                          );
                        }

                        final category = categories[index - 1];

                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: FilterChip(
                            selected: selectedCategoryId == category.id,
                            selectedColor: AppColors.primary.withOpacity(0.2),
                            backgroundColor: Colors.grey[200],
                            label: Text(category.name ?? ''),
                            labelStyle: TextStyle(
                              color: selectedCategoryId == category.id
                                  ? AppColors.primary
                                  : AppColors.black,
                            ),
                            onSelected: (bool selected) {
                              setState(() {
                                selectedCategoryId = selected
                                    ? category.id
                                    : null;
                              });
                            },
                          ),
                        );
                      },
                    );
                  },
                  orElse: () => SizedBox(),
                );
              },
            ),
          ),

          // Product List
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                final products = state
                    .maybeWhen(
                      orElse: () => [],

                      // FIX: typo succes -> success
                      success: (products) => products,
                    )
                    .where((product) {
                      bool matchesSearch = product.name!.toLowerCase().contains(
                        searchQuery,
                      );

                      bool matchesCatgeory =
                          selectedCategoryId == null ||
                          product.categoryId == selectedCategoryId;

                      return matchesSearch && matchesCatgeory;
                    })
                    .toList();

                if (products.isEmpty) {
                  return Center(
                    child: Text('Tidak ada data tiket yang ditemukan'),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) =>
                      OrderCard(itemProduk: products[index]),
                  separatorBuilder: (context, index) => SpaceHeight(12),
                  itemCount: products.length,
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Order Summary'),
                  Text(
                    4000.currencyFormatRp,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(onPressed: () {}, child: Text('Checkout')),
            ),
          ],
        ),
      ),
    );
  }
}
