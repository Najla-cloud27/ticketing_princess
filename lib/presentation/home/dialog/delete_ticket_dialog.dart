import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/build_context_ext.dart';

class DeleteTicketDialog extends StatelessWidget {
  const DeleteTicketDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hapus Data Ticket',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SpaceHeight(12),
          Text(
            'Apakah anda yakin untuk menghapus data ticket ini ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.black.withOpacity(0.5),
            ),
          ),
          SpaceHeight(24),
          Row(
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () => context.pop(),
                  label: 'Batalkan',
                  borderRadius: 8,
                  color: AppColors.buttonCancel,
                  textColor: AppColors.grey,
                  height: 44,
                  fontSize: 14,
                ),
              ),
              SpaceWidth(12),
              Flexible(
                child: Button.filled(
                  onPressed: () => context.pop(),
                  label: 'Hapus',
                  borderRadius: 8,
                  height: 44,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
