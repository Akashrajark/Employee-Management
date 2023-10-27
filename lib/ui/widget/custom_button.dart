import 'package:employee_manager/values/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final IconData iconData;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.iconData,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: isLoading
                    ? const CupertinoActivityIndicator(color: Colors.white)
                    : Icon(
                        iconData,
                        color: Colors.white38,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
