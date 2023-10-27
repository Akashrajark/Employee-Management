import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/color.dart';

class CustomActionButton extends StatelessWidget {
  final String? label;
  final IconData? iconData;
  final Color color;
  final Function() onPressed;
  final bool inverse, isLoading;
  const CustomActionButton({
    super.key,
    this.label,
    this.iconData,
    this.color = textButtonColor,
    this.inverse = false,
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: inverse ? color : color.withOpacity(.1),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: iconData != null ? 10 : 15,
          ),
          child: Row(
            mainAxisAlignment: label != null && iconData != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Text(
                label ?? '',
                textAlign: TextAlign.end,
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: inverse ? Colors.white : color,
                      ),
                ),
              ),
              SizedBox(width: label != null && iconData != null ? 5 : 0),
              if (iconData != null && !isLoading)
                Icon(
                  iconData,
                  color: inverse ? Colors.white : color,
                  size: 20,
                ),
              if (iconData != null && isLoading)
                const CupertinoActivityIndicator(radius: 10),
            ],
          ),
        ),
      ),
    );
  }
}
