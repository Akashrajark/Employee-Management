import 'package:employee_manager/data/employee/employeemodel.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/manager/managermodel.dart';
import '../../../values/color.dart';



class ManagerTable extends StatelessWidget {
  final bool scrollable, isLoading;
 
  const ManagerTable({
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
                'PASSWORD',
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
                'DEPARTMENT',
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
          child:dummyManagers.isEmpty&& !isLoading
              ? const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('No regions found!'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics:
                      scrollable ? null : const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ManagerRow(
                     managerDetail: dummyManagers[index],
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

class ManagerRow extends StatefulWidget {
  final ManagerModel managerDetail;
  const ManagerRow({
    super.key,
    required this.managerDetail,
  });

  @override
  State<ManagerRow> createState() => _RegionRowState();
}

class _RegionRowState extends State<ManagerRow> {
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
                  widget.managerDetail.name,
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
                  widget.managerDetail.email,
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
                  widget.managerDetail.password,
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
                  widget.managerDetail.phonenumber,
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
                  widget.managerDetail.department,
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
                  widget.managerDetail.date_of_joining,
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
