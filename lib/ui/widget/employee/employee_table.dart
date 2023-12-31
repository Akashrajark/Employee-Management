import 'package:employee_manager/data/employee/employeemodel.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../values/color.dart';


class EmployeeTable extends StatelessWidget {
  final bool scrollable, isLoading;
 
  const EmployeeTable({
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
                'EMAIL',
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
                'CONTACT NO',
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
                'DATE OF JOINING',
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
                'YEARS OF EXPERIENCE',
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
                'ELIGIBLE FOR PROMOTION',
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
          child:dummyEmployeeData.isEmpty&& !isLoading
              ? const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('No regions found!'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics:
                      scrollable ? null : const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => EmployRow(
                    employeeDetail: dummyEmployeeData[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                  itemCount: dummyEmployeeData.length,
                ),
        ),
      ],
    );
  }
}

class EmployRow extends StatefulWidget {
  final EmployeeModel employeeDetail;
  const EmployRow({
    super.key,
    required this.employeeDetail,
  });

  @override
  State<EmployRow> createState() => _RegionRowState();
}

class _RegionRowState extends State<EmployRow> {
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
                  widget.employeeDetail.name,
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
                flex: 6,
                child: SelectableText(
                  widget.employeeDetail.email,
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
                flex: 6,
                child: SelectableText(
                  widget.employeeDetail.contact_number,
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
                  widget.employeeDetail.date_of_joining,
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
                flex: 2,
                child: SelectableText(
                  widget.employeeDetail.years_of_experience.toString(),
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
                flex: 2,
                child: SelectableText(
                  widget.employeeDetail.isEligible.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                  ),
                ),
              ),
              // Expanded(
              //   flex: 6,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       CustomActionButton(
              //         iconData: Icons.edit_outlined,
              //         onPressed: () {
              //           showDialog(
              //             context: context,
              //             builder: (_) => AddEditRegionDialog(
              //               regionDetails: widget.regionDetails,
              //               onEdit: (region, regionId) {
              //                 // BlocProvider.of<RegionBloc>(context).add(
              //                 //   EditRegion(
              //                 //     region: region,
              //                 //     regionId: regionId,
              //                 //   ),
              //                 // );
              //               },
              //             ),
              //           );
              //         },
              //         color: Colors.orange,
              //       ),
              //       const SizedBox(width: 10),
              //       CustomActionButton(
              //         iconData: Icons.delete_forever_outlined,
              //         onPressed: () {
              //           showDialog(
              //             context: context,
              //             builder: (_) => CustomAlertDialog(
              //               title: 'DELETE REGION?',
              //               description:
              //                   'Are you sure you want to delete this region?',
              //               primaryButton: 'DELETE',
              //               onPrimaryPressed: () {
              //                 // BlocProvider.of<RegionBloc>(context).add(
              //                 //   DeleteRegion(
              //                 //     regionId: widget.regionDetails['id'],
              //                 //   ),
              //                 // );
              //                 // Navigator.pop(context);
              //               },
              //               secondaryButton: 'NO',
              //             ),
              //           );
              //         },
              //         color: Colors.red,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
