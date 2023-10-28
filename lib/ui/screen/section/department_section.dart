// import 'package:flutter/cupertino.dart';

import 'package:employee_manager/ui/widget/department/add_edit_department_dialog.dart';
import 'package:employee_manager/ui/widget/department/department_table.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../values/color.dart';
import '../../widget/custom_action_button.dart';
import '../../widget/custom_search.dart';

import '../../widget/manager/add_edit_manager_dialog.dart';
import '../../widget/manager/manager_table.dart';
import '../../widget/width_bound.dart';

class DepartmentSection extends StatefulWidget {
  const DepartmentSection({super.key});

  @override
  State<DepartmentSection> createState() => _DepartmentSectionState();
}

class _DepartmentSectionState extends State<DepartmentSection> {
  String? query;
  // RegionBloc regionBloc = RegionBloc();

  void getRegions() {
    // regionBloc.add(GetRegions(query: query));
  }

  @override
  void initState() {
    super.initState();
    getRegions();
  }

  @override
  void dispose() {
    // regionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WidthBound(
        child: Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Departments',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {
                    getRegions();
                  },
                  color: iconColor,
                  icon: const Icon(
                    Icons.replay_outlined,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 270,
                  child: CustomSearch(
                    onSearch: (value) {
                      query = value;
                      getRegions();
                    },
                  ),
                ),
                const SizedBox(width: 15),
                CustomActionButton(
                  label: 'ADD DEPARTMENT',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddEditDepartmentDialog(
                        onAdd: (region) {
                          // regionBloc.add(AddRegion(region: region));
                        },
                      ),
                    );
                  },
                  iconData: Icons.add,
                  inverse: true,
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(height: 1),
        const SizedBox(height: 20),
       const Expanded(
          child: DepartmentTable(
            isLoading: true,
           
          ),
        ),
      ],
    ));
  }
}
