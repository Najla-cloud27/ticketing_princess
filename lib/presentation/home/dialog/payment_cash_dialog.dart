import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/data/datasource/product_local_datasource.dart';
import 'package:ticketing_princes/presentation/home/bloc/order/order_bloc.dart';
import 'package:ticketing_princes/presentation/home/model/order_model.dart';
import 'package:ticketing_princes/presentation/home/pages/payment_success_page.dart';

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
                  onPressed: () => setState(() {
                    paidIndex = 0;
                    nominalController.text = widget.totalPrice.currencyFormatRp;
                  }),
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
                  onPressed: () => setState(() {
                    paidIndex = 1;
                    nominalController.text = 200000.currencyFormatRp;
                  }),
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
          // Row(
          //   children: [
          //     Flexible(
          //       child: Button.filled(
          //         onPressed: () => setState(() {
          //           paidIndex = 2;
          //           nominalController.text = 100000.currencyFormatRp;
          //         }),
          //         label: 100000.currencyFormatRp,
          //         borderRadius: 10,
          //         fontSize: 14,
          //         textColor: paidIndex == 2 ? AppColors.white : AppColors.grey,
          //         color: paidIndex == 2
          //             ? AppColors.primary
          //             : Colors.transparent,
          //       ),
          //     ),
          //     SpaceWidth(12),
          //     Flexible(
          //       child: Button.filled(
          //         onPressed: () => setState(() {
          //           paidIndex = 3;
          //           nominalController.text = 50000.currencyFormatRp;
          //         }),
          //         label: 50000.currencyFormatRp,
          //         borderRadius: 10,
          //         fontSize: 14,
          //         textColor: paidIndex == 3 ? AppColors.white : AppColors.grey,
          //         color: paidIndex == 3
          //             ? AppColors.primary
          //             : Colors.transparent,
          //       ),
          //     ),
          //   ],
          // ),
          SpaceHeight(20),
          BlocListener<OrderBloc, OrderState>(
            listener: (context, state) {
              state.maybeWhen(
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message), backgroundColor: Colors.red),
                  );
                },
                orElse: () {
                  success: (orders, totalQuantity, totalPrice, paymentNominal, paymentMethod, cashierId, cashierName) {
                    final OrderModel = OrderModel(
                      paymentMethod: paymentMethod,
                      nominalPayment: paymentNominal,
                      orders: orders,
                      totalQuantity: totalQuantity,
                      totalPrice: totalPrice,
                      cashierId: cashierId,
                      cashierName: cashierName,
                      isSyn: false,
                      transactionTime: DateTime.now().toIso8601String());
                      ProductLocalDatasource.instance.insertOrder(orderModel);
                      context.pushReplacement(PaymentSuccessPage());
                    );
                }
              )
              Navigator.of(context, rootNavigator: true).pop();
              if (state is SubjectFailed) {
                showErrorDialog(context);
              }
              if (state is SubjectSuccess) {
                showSuccessDialog(context);
              }
            },
            child: Button.filled(
              onPressed: () {},
              label: 'Bayar',
              disabled: paidIndex == -1,
              fontSize: 16,
              borderRadius: 10,
            ),
          ),
        ],
      ),
    );
  }
}
