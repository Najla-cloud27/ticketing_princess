import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/assets/assets.gen.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/build_context_ext.dart';
import 'package:ticketing_princes/presentation/home/model/printer_model.dart';
import 'package:ticketing_princes/presentation/home/widget/menu_printer_button.dart';
import 'package:ticketing_princes/presentation/home/widget/menu_priter_content.dart';

class SettingPrinterPage extends StatefulWidget {
  const SettingPrinterPage({super.key});

  @override
  State<SettingPrinterPage> createState() => _SettingPrinterPageState();
}

class _SettingPrinterPageState extends State<SettingPrinterPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelola Printer'),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Assets.images.back.image(),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Container(
            width: context.deviceWidth / 2,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.stroke,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MenuPrinterButton(
                  label: 'Search',
                  onPressed: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                  isActive: selectedIndex == 0,
                ),
                MenuPrinterButton(
                  label: 'Disconnect',
                  onPressed: () {
                    selectedIndex = 1;
                    setState(() {});
                  },
                  isActive: selectedIndex == 1,
                ),
                MenuPrinterButton(
                  label: 'Test',
                  onPressed: () {
                    selectedIndex = 2;
                    setState(() {});
                  },
                  isActive: selectedIndex == 2,
                ),
              ],
            ),
          ),
          SpaceHeight(34),
          _Body(
            selectedIndex: selectedIndex,
            // Isi object dari printer model
            dataPrinter: printerWoe,
          ),
        ],
      ),
    );
  }
}

// Setiap widget harus ada build context
// INI PRIVATE

class _Body extends StatelessWidget {
  final int selectedIndex;
  final List<PrinterModel> dataPrinter;

  const _Body({required this.selectedIndex, required this.dataPrinter});

  @override
  Widget build(BuildContext context) {
    if (dataPrinter.isEmpty) {
      return Text('Tidak ada printer yang ditemukan');
    } else if (selectedIndex == 0) {
      return Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 30,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => MenuPrinterContent(
            data: dataPrinter[index],
            // selected index dr parameter yang td dibuat
            isSelected: selectedIndex == index,
          ),
          separatorBuilder: (context, index) => SpaceHeight(12),
          itemCount: dataPrinter.length,
        ),
      );
    } else if (selectedIndex == 1) {
      return Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 30,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => MenuPrinterContent(
            data: dataPrinter[index],
            // selected index dr parameter yang td dibuat
            isSelected: selectedIndex == index,
          ),
          separatorBuilder: (context, index) => SpaceHeight(12),
          itemCount: dataPrinter.length,
        ),
      );
    } else if (selectedIndex == 2) {
      return Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 30,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => MenuPrinterContent(
            data: dataPrinter[index],
            // selected index dr parameter yang td dibuat
            isSelected: selectedIndex == index,
          ),
          separatorBuilder: (context, index) => SpaceHeight(12),
          itemCount: dataPrinter.length,
        ),
      );
    }
    return Placeholder();
  }
}
