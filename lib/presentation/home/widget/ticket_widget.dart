import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/components.dart';

import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/extensions.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';
import 'package:ticketing_princes/presentation/home/dialog/delete_ticket_dialog.dart';
import 'package:ticketing_princes/presentation/home/dialog/edit_ticket_dialog.dart';

class TicketCardWidget extends StatelessWidget {
  final Product itemProduk;
  const TicketCardWidget({super.key, required this.itemProduk});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemProduk.name ?? 'Gada nama',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      itemProduk.category!.name ?? 'Gada nama kategori',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        DeleteTicketDialog(id: itemProduk.id!),
                  );
                },
                icon: Assets.icons.delete.svg(),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        EditTicketDialog(itemProduk: itemProduk),
                  );
                },
                icon: Assets.icons.edit.svg(),
              ),
            ],
          ),
          SpaceHeight(8),
          Text(
            itemProduk.price?.currencyFormatRp ?? 'Gada harga',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
