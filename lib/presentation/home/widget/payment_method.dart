import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketing_princes/core/components/spaces.dart';
import 'package:ticketing_princes/core/constants/colors.dart';

class PaymentMethodButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;
  const PaymentMethodButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: isActive
                  ? ColorFilter.mode(
                      isActive ? AppColors.white : AppColors.grey,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
            SpaceHeight(10),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.white : AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
