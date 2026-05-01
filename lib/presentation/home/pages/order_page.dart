import 'package:dartz/dartz_streaming.dart' hide Text;
import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/presentation/home/model/product_model.dart';
import 'package:ticketing_princes/presentation/home/widget/order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Penjualan')),
      body: ListView.separated(
        // item builder untuk ngeluarin widget nya yaitu order card
        itemBuilder: (context, index) =>
            // dan isi widget order card adalah item produk
            OrderCard(itemProduk: produks[index]),
        // separator builder untuk ngasih jarak antar list
        separatorBuilder: (context, index) => SpaceHeight(12),
        // item count untuk ngeluarin data nya
        itemCount: produks.length,
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Button.filled(
                onPressed: () {
                  context.pop();
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
