import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/core.dart';

class PaymentCashDialog extends StatefulWidget {
  final int totalPrice;
  const PaymentCashDialog({super.key, required this.totalPrice});

  @override
  State<PaymentCashDialog> createState() => _PaymentCashDialogState();
}

class _PaymentCashDialogState extends State<PaymentCashDialog> {
  final nominalController = TextEditingController();
  int paidIndex = -1;

  @override
  void initState() {
    nominalController.text = widget.totalPrice.currencyFormatRp;
    super.initState();
  }

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpaceHeight(12),
          CustomTextField(
            controller: nominalController,
            label: 'Masukkan nominal',
          ),
          SpaceHeight(12),
          Row(
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () => setState(() => paidIndex = 0),
                  label: 'Uang Pas',
                  borderRadius: 10,
                  fontSize: 14,
                  textColor: paidIndex == 0 ? AppColors.white : AppColors.grey,
                  color: paidIndex == 0
                      ? AppColors.primary
                      : Colors.transparent,
                ),
              ),
              SpaceWidth(12),
              Flexible(
                child: Button.filled(
                  onPressed: () => setState(() => paidIndex = 1),
                  label: 200000.currencyFormatRp,
                  borderRadius: 10,
                  fontSize: 14,
                  textColor: paidIndex == 1 ? AppColors.white : AppColors.grey,
                  color: paidIndex == 1
                      ? AppColors.primary
                      : Colors.transparent,
                ),
              ),
            ],
          ),
          SpaceHeight(20),
          Row(
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () => setState(() => paidIndex = 2),
                  label: 100000.currencyFormatRp,
                  borderRadius: 10,
                  fontSize: 14,
                  textColor: paidIndex == 2 ? AppColors.white : AppColors.grey,
                  color: paidIndex == 2
                      ? AppColors.primary
                      : Colors.transparent,
                ),
              ),
              SpaceWidth(12),
              Flexible(
                child: Button.filled(
                  onPressed: () => setState(() => paidIndex = 3),
                  label: 50000.currencyFormatRp,
                  borderRadius: 10,
                  fontSize: 14,
                  textColor: paidIndex == 3 ? AppColors.white : AppColors.grey,
                  color: paidIndex == 3
                      ? AppColors.primary
                      : Colors.transparent,
                ),
              ),
            ],
          ),
          SpaceHeight(20),
          Button.filled(
            onPressed: () {},
            label: 'Bayar',
            disabled: paidIndex == -1,
            fontSize: 16,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
