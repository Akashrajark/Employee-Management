import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../util/validator.dart';
import '../../../values/color.dart';
import '../custom_alert_dialog.dart';

class AddEditManagerDialog extends StatefulWidget {
  final Map<String, dynamic>? regionDetails;
  final Function(Map<String, dynamic> region)? onAdd;
  final Function(Map<String, dynamic> region, int regionId)? onEdit;
  const AddEditManagerDialog({
    super.key,
    this.regionDetails,
    this.onAdd,
    this.onEdit,
  });

  @override
  State<AddEditManagerDialog> createState() => _AddEditManagerDialogState();
}

class _AddEditManagerDialogState extends State<AddEditManagerDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController dateInput = TextEditingController();

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
      title: widget.regionDetails != null ? 'EDIT EMPLOYEE' : 'ADD EMPLOYEE',
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
                'EMAIL',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
               const SizedBox(height: 10),
              Text(
                'PASSWORD',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                validator: passwordValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter Password',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'DEPARTMENT',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _departmentController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter Department',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'PHONE NUMBER',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneNumberController,
                validator: alphanumericWithSpecialCharsValidator,
                decoration: const InputDecoration(
                  hintText: 'Enter Phone Number',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'DATE OF JOINING',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: dateValidator,
                controller: dateInput,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), labelText: "Enter Date"),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    setState(() {
                      dateInput.text = formattedDate;
                    });
                  }
                },
              )
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
