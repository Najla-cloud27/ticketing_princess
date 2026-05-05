import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/presentation/home/dialog/payment_cash_dialog.dart';
import 'package:ticketing_princes/presentation/home/dialog/payment_qris_dialog.dart';
import 'package:ticketing_princes/presentation/home/model/order_model.dart';
import 'package:ticketing_princes/presentation/home/model/product_model.dart';
import 'package:ticketing_princes/presentation/home/widget/order_card_detail.dart';
import 'package:ticketing_princes/presentation/home/widget/payment_method.dart';

class OrderDetailPage extends StatelessWidget {
  final List<ProductModel> dataProduk;

  const OrderDetailPage({super.key, required this.dataProduk});

  @override
  Widget build(BuildContext context) {
    int paymentButtonIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Assets.images.back.image(),
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            OrderCardDetail(itemOrder: orders[index]),
        separatorBuilder: (context, index) => SpaceHeight(20),
        itemCount: orders.length,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatefulBuilder(
              builder: (context, setState) => Row(
                children: [
                  Expanded(
                    child: PaymentMethodButton(
                      iconPath: Assets.icons.payment.qris.path,
                      label: 'Qris',
                      isActive: paymentButtonIndex == 0,
                      onPressed: () => setState(() => paymentButtonIndex = 0),
                    ),
                  ),
                  SpaceWidth(20),
                  Expanded(
                    child: PaymentMethodButton(
                      iconPath: Assets.icons.payment.tunai.path,
                      label: 'Tunai',
                      isActive: paymentButtonIndex == 0,
                      onPressed: () => setState(() => paymentButtonIndex = 1),
                    ),
                  ),
                  SpaceWidth(20),
                  Expanded(
                    child: PaymentMethodButton(
                      iconPath: Assets.icons.payment.transfer.path,
                      label: 'Transfer',
                      isActive: paymentButtonIndex == 0,
                      onPressed: () => setState(() => paymentButtonIndex = 2),
                    ),
                  ),
                ],
              ),
            ),
            SpaceHeight(24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    spreadRadius: 0,
                    offset: Offset(0, -2),
                    color: AppColors.black.withOpacity(0.8),
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          60000.currencyFormatRp,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Button.filled(
                      onPressed: () {
                        if (paymentButtonIndex == 0) {
                          showDialog(
                            context: context,
                            builder: (context) => PaymentQrisDialog(),
                          );
                        } else if (paymentButtonIndex == 1) {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                PaymentCashDialog(totalPrice: 14000),
                          );
                        }
                      },
                      label: 'Process',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
