import 'package:employee_manager/data/department/departmentmodel.dart';
import 'package:employee_manager/data/employee/employeemodel.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/manager/managermodel.dart';
import '../../../values/color.dart';

class DepartmentTable extends StatelessWidget {
  final bool scrollable, isLoading;

  const DepartmentTable({
    super.key,
    this.scrollable = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SelectableText(
                'NAME',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SelectableText(
                'LOCATION',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SelectableText(
                'MANAGER ID',
                textAlign: TextAlign.end,
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SelectableText(
                'NO OF EMPLOYEES',
                textAlign: TextAlign.end,
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
            ),
           
          ],
        ),
        const SizedBox(height: 20),
        if (isLoading)
          const LinearProgressIndicator(
            minHeight: 1,
          )
        else
          const Divider(
            thickness: 1,
            height: 1,
          ),
        Flexible(
          child: dummyManagers.isEmpty && !isLoading
              ? const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('No regions found!'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics:
                      scrollable ? null : const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => DepartmentRow(
                    departmentDetail: dummyDepartments[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                  itemCount: dummyManagers.length,
                ),
        ),
      ],
    );
  }
}

class DepartmentRow extends StatefulWidget {
  final DepartmentModel departmentDetail;
  const DepartmentRow({
    super.key,
    required this.departmentDetail,
  });

  @override
  State<DepartmentRow> createState() => _RegionRowState();
}

class _RegionRowState extends State<DepartmentRow> {
  bool _isHovering = false;

  void onHover(e) {
    _isHovering = !_isHovering;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onHover,
      onExit: onHover,
      child: Material(
        color: _isHovering ? rowFillColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: SelectableText(
                  widget.departmentDetail.name,
                  style: GoogleFonts.montserrat(
                    textStyle:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SelectableText(
                  widget.departmentDetail.location,
                  style: GoogleFonts.montserrat(
                    textStyle:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SelectableText(
                  widget.departmentDetail.manager_id,
                  style: GoogleFonts.montserrat(
                    textStyle:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SelectableText(
                  widget.departmentDetail.no_of_employees.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
