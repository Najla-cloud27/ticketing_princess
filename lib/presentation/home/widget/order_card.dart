import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/extensions.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';

class OrderCard extends StatelessWidget {
  final Product itemProduk;
  const OrderCard({super.key, required this.itemProduk});

  @override
  Widget build(BuildContext context) {
    final quantityNotifier = ValueNotifier(0);
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  itemProduk.name ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                onTap: () {
                  if (quantityNotifier.value > 0) {
                    quantityNotifier.value--;
                  }
                },
                child: Assets.icons.reduceQuantity.svg(),
              ),
              ValueListenableBuilder(
                valueListenable: quantityNotifier,
                builder: (context, value, _) => Text(
                  '$value',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),

              InkWell(
                onTap: () => quantityNotifier.value++,
                child: Assets.icons.addQuantity.svg(),
              ),
            ],
          ),
          Text(
            itemProduk.category?.name ?? '',
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
                itemProduk.price!.currencyFormatRp,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              // panggil disini karna dia bukan data dummy, krna dia ini perubahan ui nya
              ValueListenableBuilder(
                valueListenable: quantityNotifier,
                builder: (context, value, child) => Text(
                  (itemProduk.price! * value).currencyFormatRp,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
