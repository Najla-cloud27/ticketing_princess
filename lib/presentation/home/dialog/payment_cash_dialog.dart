import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/data/datasource/product_local_datasource.dart';
import 'package:ticketing_princes/presentation/home/bloc/order/order_bloc.dart';
import 'package:ticketing_princes/presentation/home/model/order_model.dart';
import 'package:ticketing_princes/presentation/home/pages/payment_success_page.dart';

class PaymentCashDialog extends StatefulWidget {
  final int totalPrice;

  const PaymentCashDialog({
    super.key,
    required this.totalPrice,
  });

  @override
  State<PaymentCashDialog> createState() => _PaymentCashDialogState();
}

class _PaymentCashDialogState extends State<PaymentCashDialog> {
  final TextEditingController nominalController = TextEditingController();

  int paidIndex = -1;

  @override
  void initState() {
    super.initState();
    nominalController.text = widget.totalPrice.currencyFormatRp;
  }

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
            success: (
              orders,
              totalQuantity,
              totalPrice,
              paymentNominal,
              paymentMethod,
              cashierId,
              cashierName,
            ) async {
              final orderModel = OrderModel(
                paymentMethod: paymentMethod,
                nominalPayment: paymentNominal,
                orders: orders,
                totalQuantity: totalQuantity,
                totalPrice: totalPrice,
                cashierId: cashierId,
                cashierName: cashierName,
                isSync: false,
                transactionTime: DateTime.now().toIso8601String(),
              );

              await ProductLocalDatasource.instance.insertOrder(
                orderModel,
              );

              if (!context.mounted) return;

              context.pushReplacement(
                PaymentSuccessPage(
                  order: orderModel,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SpaceHeight(12),

            CustomTextField(
              controller: nominalController,
              label: 'Masukkan nominal',
            ),

            const SpaceHeight(12),

            Row(
              children: [
                Flexible(
                  child: Button.filled(
                    onPressed: () {
                      setState(() {
                        paidIndex = 0;
                        nominalController.text =
                            widget.totalPrice.currencyFormatRp;
                      });
                    },
                    label: 'Uang Pas',
                    borderRadius: 10,
                    fontSize: 14,
                    textColor: paidIndex == 0
                        ? AppColors.white
                        : AppColors.grey,
                    color: paidIndex == 0
                        ? AppColors.primary
                        : Colors.transparent,
                  ),
                ),
                const SpaceWidth(12),
                Flexible(
                  child: Button.filled(
                    onPressed: () {
                      setState(() {
                        paidIndex = 1;
                        nominalController.text =
                            200000.currencyFormatRp;
                      });
                    },
                    label: 200000.currencyFormatRp,
                    borderRadius: 10,
                    fontSize: 14,
                    textColor: paidIndex == 1
                        ? AppColors.white
                        : AppColors.grey,
                    color: paidIndex == 1
                        ? AppColors.primary
                        : Colors.transparent,
                  ),
                ),
              ],
            ),

            const SpaceHeight(20),

            Row(
              children: [
                Flexible(
                  child: Button.filled(
                    onPressed: () {
                      setState(() {
                        paidIndex = 2;
                        nominalController.text =
                            100000.currencyFormatRp;
                      });
                    },
                    label: 100000.currencyFormatRp,
                    borderRadius: 10,
                    fontSize: 14,
                    textColor: paidIndex == 2
                        ? AppColors.white
                        : AppColors.grey,
                    color: paidIndex == 2
                        ? AppColors.primary
                        : Colors.transparent,
                  ),
                ),
                const SpaceWidth(12),
                Flexible(
                  child: Button.filled(
                    onPressed: () {
                      setState(() {
                        paidIndex = 3;
                        nominalController.text =
                            50000.currencyFormatRp;
                      });
                    },
                    label: 50000.currencyFormatRp,
                    borderRadius: 10,
                    fontSize: 14,
                    textColor: paidIndex == 3
                        ? AppColors.white
                        : AppColors.grey,
                    color: paidIndex == 3
                        ? AppColors.primary
                        : Colors.transparent,
                  ),
                ),
              ],
            ),

            const SpaceHeight(20),
          ],
        ),
      ),
    );
  }
}