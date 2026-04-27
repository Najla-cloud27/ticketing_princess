import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/core.dart';
import 'package:ticketing_princes/presentation/home/model/history_model.dart';

class HistoryCard extends StatelessWidget {
  final HistoryModel itemHistory;
  const HistoryCard({super.key, required this.itemHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Assets.icons.plus.svg(),
          SpaceWidth(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemHistory.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SpaceHeight(5),
              Text(
                itemHistory.dateTime.toFormattedDayTime(),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          // Spacer untuk menghabiskan ruang diantara nama produk dan harga
          Spacer(),
          Text(
            itemHistory.price.currencyFormatRp,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
