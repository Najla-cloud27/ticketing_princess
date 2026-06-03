import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/presentation/home/bloc/product/product_bloc.dart';
import 'package:ticketing_princes/presentation/home/dialog/add_ticket_dialog.dart';
import 'package:ticketing_princes/presentation/home/widget/ticket_widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductEvent.getProducts());
    super.initState();
  }

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
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (products) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: products.length,
                separatorBuilder: (context, index) => const SpaceHeight(20.0),
                itemBuilder: (context, index) =>
                    TicketCardWidget(itemProduk: products[index]),
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
