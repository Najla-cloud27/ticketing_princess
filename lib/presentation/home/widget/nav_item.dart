import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketing_princes/core/components/components.dart';
import 'package:ticketing_princes/core/constants/colors.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.primary : AppColors.navInActive,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SpaceHeight(10),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? AppColors.primary : AppColors.navInActive,
            ),
          ),
        ],
      ),
    );
  }
}
