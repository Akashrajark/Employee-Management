import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_action_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String? description, primaryButton, secondaryButton;
  final Widget? content;
  final Function()? onPrimaryPressed, onSecondaryPressed;
  final double width;
  final bool isLoading;
  const CustomAlertDialog({
    super.key,
    required this.title,
    this.description,
    this.primaryButton,
    this.secondaryButton,
    this.content,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.width = 400,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                )),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              if (isLoading)
                const LinearProgressIndicator(
                  minHeight: 1,
                )
              else
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
              const SizedBox(height: 5),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          description!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              if (content != null) content!,
              if (primaryButton != null && secondaryButton != null)
                const Divider(
                  height: 20,
                  thickness: 1,
                ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ),
                child: Row(
                  children: [
                    if (secondaryButton != null)
                      Expanded(
                        child: CustomActionButton(
                          label: secondaryButton,
                          onPressed: onSecondaryPressed ??
                              () => Navigator.pop(context),
                          color: Colors.grey,
                        ),
                      ),
                    if (primaryButton != null && secondaryButton != null)
                      const SizedBox(width: 10),
                    if (primaryButton != null)
                      Expanded(
                        child: CustomActionButton(
                          label: primaryButton,
                          inverse: true,
                          onPressed:
                              onPrimaryPressed ?? () => Navigator.pop(context),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
