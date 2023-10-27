import 'package:flutter/material.dart';

import '../widget/account_button.dart';
import '../widget/branding.dart';
import '../widget/custom_drawer.dart';
import 'section/dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Branding(height: 25),
        actions: const [AccountButton()],
      ),
      drawer: CustomDrawer(
        tabController: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          DashboardSection(
            tabController: _tabController,
          ),
        ],
      ),
    );
  }
}
