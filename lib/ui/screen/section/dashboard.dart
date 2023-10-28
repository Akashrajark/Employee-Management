import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../bloc/dashboard/dashboard_bloc.dart';
import '../../../values/color.dart';
import '../../widget/custom_alert_dialog.dart';
import '../../widget/dashboard/dashboard_item.dart';
import '../../widget/width_bound.dart';

class DashboardSection extends StatefulWidget {
  final TabController tabController;
  const DashboardSection({super.key, required this.tabController});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  final DashboardBloc _dashboardBloc = DashboardBloc();

  final ScrollController _scrollController = ScrollController();

  bool paginated = false;

  Map<String, dynamic> params = {
    'search_query': null,
    'search_order_id': null,
    'is_direct': true,
    'order_status': 'pending',
    'order_status_except': null,
    'order_payment_status': null,
    'search_service_area_id': null,
    'search_franchise_id': null,
    'search_customer_id': null,
    'date_from': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'date_to': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'skip': null,
    'take': 20,
  };

  final List _orders = [];

  final Map<String, dynamic> _dashboardData = {
    'franchises': 0,
    'customers': 0,
    'products': 0,
    'categories': 0,
    'service_areas': 0,
    'complaints': 0,
    'withdraws': 0,
    'sales_today': 0,
    'pending_today': 0,
    'packed_today': 0,
    'ofd_today': 0,
    'delivered_today': 0,
  };

  void getOrders({bool restart = false}) {
    if (!restart && _orders.isNotEmpty) {
      params['skip'] = _orders.length;
    } else {
      params['skip'] = null;
    }

    paginated = !restart;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _dashboardBloc.add(DashboardEvent());
    getOrders(restart: true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getOrders();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>.value(
          value: _dashboardBloc,
        ),
      ],
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, dashboardState) {
          if (dashboardState is DashboardFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: dashboardState.message,
                primaryButton: 'OK',
              ),
            );
          } else if (dashboardState is DashboardSuccessState) {
            //_dashboardData = dashboardState.dashboard;
          }
        },
        builder: (context, dashboardState) {
          return WidthBound(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 50),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    IconButton(
                      onPressed: dashboardState is DashboardLoadingState
                          ? null
                          : () {
                              _dashboardBloc.add(DashboardEvent());
                            },
                      color: iconColor,
                      icon: dashboardState is DashboardLoadingState
                          ? const CupertinoActivityIndicator(
                              radius: 12,
                            )
                          : const Icon(
                              Icons.replay_outlined,
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    DashboardItem(
                      label: 'EMPLOYEES',
                      value: '${_dashboardData['sales_today']}',
                      iconData: Icons.people_alt_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(1);
                      },
                    ), DashboardItem(
                      label: 'MANAGERS',
                      value: _dashboardData['customers'].toString(),
                      iconData: Icons.person_2_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(2);
                      },
                    ),
                    DashboardItem(
                      label: 'DEPARTMENTS',
                      value: _dashboardData['franchises'].toString(),
                      iconData: Icons.store_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(3);
                      },
                    ),
                   
                  
                  ],
                ),

                
              ],
            ),
          );
        },
      ),
    );
  }
}
