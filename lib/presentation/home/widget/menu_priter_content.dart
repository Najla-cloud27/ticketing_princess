import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_princes/presentation/home/model/printer_model.dart';

class MenuPrinterContent extends StatelessWidget {
  final PrinterModel data;
  final bool isSelected;
  const MenuPrinterContent({
    super.key,
    required this.data,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Printer: ${data.name}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            'Alamat: ${data.address}',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
