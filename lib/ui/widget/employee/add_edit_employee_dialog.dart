import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/validator.dart';
import '../../../values/color.dart';
import '../custom_alert_dialog.dart';

class AddEditRegionDialog extends StatefulWidget {
  final Map<String, dynamic>? regionDetails;
  final Function(Map<String, dynamic> region)? onAdd;
  final Function(Map<String, dynamic> region, int regionId)? onEdit;
  const AddEditRegionDialog({
    super.key,
    this.regionDetails,
    this.onAdd,
    this.onEdit,
  });

  @override
  State<AddEditRegionDialog> createState() => _AddEditRegionDialogState();
}

class _AddEditRegionDialogState extends State<AddEditRegionDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.regionDetails != null) {
      _nameController.text = widget.regionDetails!['name'];
      _descriptionController.text = widget.regionDetails!['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: widget.regionDetails != null ? 'EDIT REGION' : 'ADD REGION',
      content: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NAME',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'DESCRIPTION',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                validator: alphanumericWithSpecialCharsValidator,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Enter Description',
                ),
              ),
            ],
          ),
        ),
      ),
      primaryButton: 'SAVE',
      onPrimaryPressed: () {
        if (formKey.currentState!.validate()) {
          if (widget.regionDetails != null) {
            //edit
            widget.onEdit!({
              'name': _nameController.text.trim(),
              'description': _descriptionController.text.trim(),
            }, widget.regionDetails!['id']);
            Navigator.pop(context);
          } else {
            //add
            widget.onAdd!({
              'name': _nameController.text.trim(),
              'description': _descriptionController.text.trim(),
            });
            Navigator.pop(context);
          }
        }
      },
    );
  }
}
