import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_action_button.dart';
import '../custom_alert_dialog.dart';

class RegionTable extends StatelessWidget {
  final bool scrollable, isLoading;
  final List<dynamic> regions;
  const RegionTable({
    super.key,
    this.scrollable = true,
    this.isLoading = false,
    required this.regions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: SelectableText(
                'REGION',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SelectableText(
                'DESCRIPTION',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: mutedTextColor,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SelectableText(
                'ACTIONS',
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
          child: regions.isEmpty && !isLoading
              ? const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('No regions found!'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics:
                      scrollable ? null : const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => RegionRow(
                    regionDetails: regions[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                  itemCount: regions.length,
                ),
        ),
      ],
    );
  }
}

class RegionRow extends StatefulWidget {
  final Map<String, dynamic> regionDetails;
  const RegionRow({
    super.key,
    required this.regionDetails,
  });

  @override
  State<RegionRow> createState() => _RegionRowState();
}

class _RegionRowState extends State<RegionRow> {
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
                  widget.regionDetails['name'],
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
                  widget.regionDetails['description'],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomActionButton(
                      iconData: Icons.edit_outlined,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AddEditRegionDialog(
                            regionDetails: widget.regionDetails,
                            onEdit: (region, regionId) {
                              BlocProvider.of<RegionBloc>(context).add(
                                EditRegion(
                                  region: region,
                                  regionId: regionId,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 10),
                    CustomActionButton(
                      iconData: Icons.delete_forever_outlined,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => CustomAlertDialog(
                            title: 'DELETE REGION?',
                            description:
                                'Are you sure you want to delete this region?',
                            primaryButton: 'DELETE',
                            onPrimaryPressed: () {
                              BlocProvider.of<RegionBloc>(context).add(
                                DeleteRegion(
                                  regionId: widget.regionDetails['id'],
                                ),
                              );
                              Navigator.pop(context);
                            },
                            secondaryButton: 'NO',
                          ),
                        );
                      },
                      color: Colors.red,
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
