import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/spaces.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/extensions.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';

import 'package:ticketing_princes/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:ticketing_princes/presentation/home/model/order_item_model.dart';

class OrderCard extends StatefulWidget {
  final Product itemProduk;
  const OrderCard({Key? key, required this.itemProduk});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    //isinya berubah kalo user klik tambah atau kurang, jadi pake ValueNotifier
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.itemProduk.name ?? 'Gada nama',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<CheckoutBloc>().add(
                    CheckoutEvent.removeCheckout(widget.itemProduk),
                  );
                },
                child: Assets.icons.reduceQuantity.svg(),
              ),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  final quantity = state.maybeWhen(
                    success: (checkout) => checkout
                        .firstWhere(
                          (e) => e.product.id == widget.itemProduk.id,
                          orElse: () => OrderItem(
                            product: widget.itemProduk,
                            quantity: 0,
                          ),
                        )
                        .quantity,
                    orElse: () => 0,
                  );
                  return Text(
                    quantity.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  context.read<CheckoutBloc>().add(
                    CheckoutEvent.addCheckout(widget.itemProduk),
                  );
                },
              ),
            ],
          ),
          Text(
            widget.itemProduk.category?.name ?? 'Gada kategori',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          SpaceHeight(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.itemProduk.price!.currencyFormatRp,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (checkout) {
                      final quantity = checkout
                          .firstWhere(
                            (e) => e.product.id == widget.itemProduk.id,
                            orElse: () => OrderItem(
                              product: widget.itemProduk,
                              quantity: 0,
                            ),
                          )
                          .quantity;
                      return Text(
                        'Total: ${(widget.itemProduk.price! * quantity).currencyFormatRp}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      );
                    },
                    orElse: () => SizedBox(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
