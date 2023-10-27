import 'package:flutter/material.dart';

import '../../../values/color.dart';

class DashboardItem extends StatelessWidget {
  final String label, value;
  final IconData iconData;
  final Function() onPressed;
  const DashboardItem({
    super.key,
    required this.label,
    required this.value,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 285,
      height: 100,
      child: Material(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: borderColor,
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        value,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Icon(
                  iconData,
                  color: iconColor,
                  size: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
