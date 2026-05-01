import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/date_time_ext.dart';
import 'package:ticketing_princes/core/extensions/extensions.dart';
import 'package:ticketing_princes/presentation/home/model/history_model.dart';
import 'package:ticketing_princes/presentation/home/widget/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<HistoryModel>> groupedHistory = {};

    for (var data in histories) {
      final monthYear =
          '${data.dateTime.toFormattedMonth()} ${data.dateTime.year}';

      if (!groupedHistory.containsKey(monthYear)) {
        groupedHistory[monthYear] = [];
      }

      groupedHistory[monthYear]!.add(data);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: groupedHistory.entries.map((entry) {
          final monthYear = entry.key;
          final data = entry.value;

          final total = data.fold(
            0,
            (previousValue, element) => previousValue + element.price,
          );

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      monthYear,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total.currencyFormatRp,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 3,
                  color: AppColors.primary,
                  endIndent: context.deviceWidth - 60,
                ),
                ...data.map((item) => HistoryCard(itemHistory: item)).toList(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
