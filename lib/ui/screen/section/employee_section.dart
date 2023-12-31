
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../values/color.dart';
import '../../widget/custom_action_button.dart';
import '../../widget/custom_search.dart';
import '../../widget/employee/add_edit_employee_dialog.dart';
import '../../widget/employee/employee_table.dart';
import '../../widget/width_bound.dart';

class EmployeeSection extends StatefulWidget {
  const EmployeeSection({super.key});

  @override
  State<EmployeeSection> createState() => _EmployeeSectionState();
}

class _EmployeeSectionState extends State<EmployeeSection> {
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
                  'Employees',
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
                  label: 'ADD EMPLOYEE',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddEditEmployeeDialog(
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
      const  Expanded(
          child: EmployeeTable(
            isLoading: true,
           
          ),
        ),
      ],
    ));
  }
}
//      BlocProvider<RegionBloc>.value(
//         value: regionBloc,
//         child: BlocConsumer<RegionBloc, RegionState>(
//           listener: (context, state) {
//             if (state is RegionFailureState) {
//               showDialog(
//                 context: context,
//                 builder: (context) => CustomAlertDialog(
//                   title: 'Failure',
//                   description: state.message,
//                   primaryButton: 'OK',
//                 ),
//               );
//             } else if (state is RegionSuccessState) {
//               getRegions();
//             }
//           },
//           builder: (context, state) {
//             return Column(
//               children: [
//                 const SizedBox(height: 50),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Region',
//                           style: Theme.of(context).textTheme.headlineSmall,
//                         ),
//                         IconButton(
//                           onPressed: state is RegionLoadingState
//                               ? null
//                               : () {
//                                   getRegions();
//                                 },
//                           color: iconColor,
//                           icon: state is RegionLoadingState
//                               ? const CupertinoActivityIndicator()
//                               : const Icon(
//                                   Icons.replay_outlined,
//                                 ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         SizedBox(
//                           width: 270,
//                           child: CustomSearch(
//                             onSearch: (value) {
//                               query = value;
//                               getRegions();
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 15),
//                         CustomActionButton(
//                           label: 'ADD REGION',
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) => AddEditRegionDialog(
//                                 onAdd: (region) {
//                                   regionBloc.add(AddRegion(region: region));
//                                 },
//                               ),
//                             );
//                           },
//                           iconData: Icons.add,
//                           inverse: true,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 const Divider(height: 1),
//                 const SizedBox(height: 20),
//                 Expanded(
//                   child: RegionTable(
//                     isLoading: state is RegionLoadingState,
//                     regions:
//                         state is RegionGetSuccessState ? state.regions : [],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
