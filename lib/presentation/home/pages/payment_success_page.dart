import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticketing_princes/core/assets/assets.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/core/extensions/build_context_ext.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Payment Receipt',
          style: TextStyle(color: AppColors.white),
        ),
        // Kalau di kiri namanya leading, kalau di kanan action
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Assets.images.back.image(color: AppColors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: context.deviceHeight / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              color: AppColors.primary,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.receiptCard.provider(),
                alignment: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(60),
              child: Column(
                children: [
                  Text(
                    'PAYMENT RECEIPT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SpaceHeight(16),
                  QrImageView(
                    data: 'payment receipt',
                    version: QrVersions.auto,
                  ),
                  SpaceHeight(16),
                  Text('Scan this QR code to verify tickets'),
                  SpaceHeight(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tagihan',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(50000.currencyFormatRp),
                    ],
                  ),
                  SpaceHeight(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Metode Bayar',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('Transfer Bank'),
                    ],
                  ),
                  SpaceHeight(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Waktu',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(DateTime.now().toFormattedDate()),
                    ],
                  ),
                  SpaceHeight(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('Sukses'),
                    ],
                  ),
                  SpaceHeight(8),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(36, 0, 36, 20),
        child: Button.filled(
          onPressed: () {},
          label: 'Cetak Transaksi',
          borderRadius: 10,
        ),
      ),
    );
  }
}
