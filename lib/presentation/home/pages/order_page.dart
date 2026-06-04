import 'package:dartz/dartz_streaming.dart' hide Text;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/build_context_ext.dart';
import 'package:ticketing_princes/core/extensions/num_ext.dart';
import 'package:ticketing_princes/presentation/home/bloc/category/category_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:ticketing_princes/presentation/home/bloc/product/product_bloc.dart';
import 'package:ticketing_princes/presentation/home/model/product_model.dart';
import 'package:ticketing_princes/presentation/home/pages/order_detail_page.dart';
import 'package:ticketing_princes/presentation/home/widget/order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String searchQuery = '';
  int? selectedCategoryId;

  // InitState itu sesuatu yang di running sekali saat halaman dibuka atau dibuat
  // jadi kalau kita mau fetch data dari API atau database, kita bisa taruh di initState
  @override
  void initState() {
    // Pake yang local biar bisa dipakai offline
    context.read<ProductBloc>().add(ProductEvent.getLocalProducts());
    context.read<CategoryBloc>().add(CategoryEvent.fetch());

    super.initState();
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
                hintText: 'Search ticket...',
                prefixIcon: Icon(Icons.search, color: AppColors.primary),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

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
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: FilterChip(
                              selected: selectedCategoryId == null,
                              selectedColor: AppColors.primary.withOpacity(0.2),
                              backgroundColor: Colors.grey[200],
                              labelStyle: TextStyle(
                                color: selectedCategoryId == null
                                    ? AppColors.primary
                                    : Colors.black,
                              ),
                              label: Text('All'),
                              onSelected: (bool selected) {
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
                                  : Colors.black,
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

          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                final products = state
                    .maybeWhen(
                      orElse: () => [],
                      success: (products) => products,
                    )
                    .where((product) {
                      bool matchesSearch = product.name.toLowerCase().contains(
                        searchQuery,
                      );
                      bool matchesCategory =
                          selectedCategoryId == null ||
                          product.category?.id == selectedCategoryId;
                      return matchesSearch && matchesCategory;
                    })
                    .toList();

                if (products.isEmpty) {
                  return Center(
                    child: Text('Tidak ada data tiket yang ditemukan'),
                  );
                }
                return ListView.separated(
                  // item builder untuk ngeluarin widget nya yaitu order card
                  itemBuilder: (context, index) =>
                      // dan isi widget order card adalah item produk
                      OrderCard(itemProduk: products[index]),
                  // separator builder untuk ngasih jarak antar list
                  separatorBuilder: (context, index) => SpaceHeight(12),
                  // item count untuk ngeluarin data nya
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
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (checkout) {
                          final total = checkout.fold<int>(
                            0,
                            (previousValue, element) =>
                                (previousValue +
                                element.product.price! * element.quantity),
                          );
                          return Text(
                            total.currencyFormatRp,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                        orElse: () => Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Button.filled(
                onPressed: () {
                  context.push(OrderDetailPage());
                },
                label: 'Process',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
