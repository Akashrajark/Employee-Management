import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../util/validator.dart';
import '../../../values/color.dart';
import '../custom_alert_dialog.dart';

class AddEditDepartmentDialog extends StatefulWidget {
  final Map<String, dynamic>? regionDetails;
  final Function(Map<String, dynamic> region)? onAdd;
  final Function(Map<String, dynamic> region, int regionId)? onEdit;
  const AddEditDepartmentDialog({
    super.key,
    this.regionDetails,
    this.onAdd,
    this.onEdit,
  });

  @override
  State<AddEditDepartmentDialog> createState() => _AddEditDepartmentDialogState();
}

class _AddEditDepartmentDialogState extends State<AddEditDepartmentDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();
  final TextEditingController _managerController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    // if (widget.regionDetails != null) {
    //   _nameController.text = widget.regionDetails!['name'];
    //   _descriptionController.text = widget.regionDetails!['description'];
    // }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: widget.regionDetails != null ? 'EDIT DEPARTMENT' : 'ADD DEPARTMENT',
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
                'LOCATION',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter Location',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'MANAGER ID',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _managerController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter Manager ID',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'NO OF EMPLOYEES',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _employeeController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter No Of Employees',
                ),
              ),
              const SizedBox(height: 10),
             
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
              'description': '',
            }, widget.regionDetails!['id']);
            Navigator.pop(context);
          } else {
            //add
            // widget.onAdd!({
            //   'name': _nameController.text.trim(),
            //   'description': _descriptionController.text.trim(),
            // });
            Navigator.pop(context);
          }
        }
      },
    );
  }
}
