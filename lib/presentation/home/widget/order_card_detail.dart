import 'package:flutter/widgets.dart';
import 'package:ticketing_princes/core/components/spaces.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/extensions.dart';
import 'package:ticketing_princes/presentation/home/model/order_model.dart';

class OrderCardDetail extends StatelessWidget {
  final OrderModel itemOrder;

  const OrderCardDetail({super.key, required this.itemOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemOrder.product.namaProduk,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            itemOrder.product.typeProduk,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),
          SpaceHeight(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // kalo mau memasukkan data yang berupa string atau tulisan itu pake dolar dan kurung kurawal
                '${itemOrder.product.hargaProduk!.currencyFormatRp} x ${itemOrder.quantity}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              Text(
                // disini pakai tanda kurung karena mau menjumlahlan produk dan si quantity nya
                (itemOrder.product.hargaProduk! * itemOrder.quantity)
                    .currencyFormatRp,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
