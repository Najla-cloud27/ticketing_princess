import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/presentation/home/dialog/add_ticket_dialog.dart';
import 'package:ticketing_princes/presentation/home/model/product_model.dart';
import 'package:ticketing_princes/presentation/home/widget/ticket_widget.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Tiket'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddTicketDialog(),
              );
            },
            icon: Assets.icons.plus.svg(),
          ),
          SpaceHeight(8),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) =>
            TicketCardWidget(itemProduk: produks[index]),
        separatorBuilder: (context, index) => const SpaceHeight(20),
        itemCount: produks.length,
      ),
    );
  }
}
