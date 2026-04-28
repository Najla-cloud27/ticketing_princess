import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketing_princes/core/components/components.dart';

class SettingButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  const SettingButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.1),
              blurRadius: 30,
              spreadRadius: 0,
              offset: Offset(0, 2),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            SpaceHeight(10),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
