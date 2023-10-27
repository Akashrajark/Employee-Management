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

  List _orders = [];

  Map<String, dynamic> _dashboardData = {
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
                      label: 'SALSES TODAY',
                      value: '₹${_dashboardData['sales_today']}',
                      iconData: Icons.shopping_cart_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(1);
                      },
                    ),
                    DashboardItem(
                      label: 'FRANCHISES',
                      value: _dashboardData['franchises'].toString(),
                      iconData: Icons.store_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(3);
                      },
                    ),
                    DashboardItem(
                      label: 'CUSTOMERS',
                      value: _dashboardData['customers'].toString(),
                      iconData: Icons.people_alt_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(5);
                      },
                    ),
                    DashboardItem(
                      label: 'PRODUCTS',
                      value: _dashboardData['products'].toString(),
                      iconData: Icons.widgets_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(4);
                      },
                    ),
                    DashboardItem(
                      label: 'SERVICE AREAS',
                      value: _dashboardData['service_areas'].toString(),
                      iconData: Icons.map_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(6);
                      },
                    ),
                    DashboardItem(
                      label: 'CATEGORIES',
                      value: _dashboardData['categories'].toString(),
                      iconData: Icons.category_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(7);
                      },
                    ),
                    DashboardItem(
                      label: 'WITHDRAWALS',
                      value: _dashboardData['withdraws'].toString(),
                      iconData: Icons.account_balance_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(2);
                      },
                    ),
                    DashboardItem(
                      label: 'COMPLAINTS',
                      value: _dashboardData['complaints'].toString(),
                      iconData: Icons.info_outline,
                      onPressed: () {
                        widget.tabController.animateTo(8);
                      },
                    ),
                    DashboardItem(
                      label: "PENDING TODAY",
                      value: _dashboardData['pending_today'].toString(),
                      iconData: Icons.shopping_cart_checkout_sharp,
                      onPressed: () {
                        widget.tabController.animateTo(1);
                      },
                    ),
                    DashboardItem(
                      label: 'PACKED TODAY',
                      value: _dashboardData['packed_today'].toString(),
                      iconData: Icons.conveyor_belt,
                      onPressed: () {
                        widget.tabController.animateTo(1);
                      },
                    ),
                    DashboardItem(
                      label: 'OFD TODAY',
                      value: _dashboardData['ofd_today'].toString(),
                      iconData: Icons.delivery_dining_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(1);
                      },
                    ),
                    DashboardItem(
                      label: 'DELIVERED TODAY',
                      value: _dashboardData['delivered_today'].toString(),
                      iconData: Icons.inventory_outlined,
                      onPressed: () {
                        widget.tabController.animateTo(1);
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
