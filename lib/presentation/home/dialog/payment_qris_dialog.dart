import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:ticketing_princes/core/core.dart';

class PaymentQrisDialog extends StatelessWidget {
  const PaymentQrisDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Scan QR Code to Pay'),
          SpaceHeight(24),
          InkWell(
            onTap: () => context.pop(),
            child: SizedBox(
              height: 200,
              width: 200,
              child: QrImageView(
                data: 'Bayar Qris',
                version: QrVersions.auto,
                size: 200,
              ),
            ),
          ),
          SpaceHeight(24),
          Countdown(
            seconds: 60,
            build: (context, time) => Text.rich(
              TextSpan(
                text: 'QR expires in ',
                children: [
                  TextSpan(
                    text: '$time seconds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
