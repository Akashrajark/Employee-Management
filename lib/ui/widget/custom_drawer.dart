import 'package:flutter/material.dart';

import '../../values/color.dart';
import 'change_password.dart';

class CustomDrawer extends StatefulWidget {
  final TabController tabController;
  const CustomDrawer({
    super.key,
    required this.tabController,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void changeIndex(int index) {
    widget.tabController.animateTo(index);
    setState(() {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: BackButton(),
              ),
              const SizedBox(height: 50),
              Text(
                'MENU',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              DrawerButton(
                label: 'Dashboard',
                iconData: Icons.dashboard_outlined,
                onPressed: () {
                  changeIndex(0);
                },
                isSelected: widget.tabController.index == 0,
              ),
              const SizedBox(height: 10),
              DrawerButton(
                label: 'Regions',
                iconData: Icons.area_chart_outlined,
                onPressed: () {
                  changeIndex(1);
                },
                isSelected: widget.tabController.index == 1,
              ),
              const SizedBox(height: 10),
              DrawerButton(
                label: 'Countries',
                iconData: Icons.language_outlined,
                onPressed: () {
                  changeIndex(2);
                },
                isSelected: widget.tabController.index == 2,
              ),
              const SizedBox(height: 10),
              DrawerButton(
                label: 'Staff Type',
                iconData: Icons.people_alt,
                onPressed: () {
                  changeIndex(3);
                },
                isSelected: widget.tabController.index == 3,
              ),
              const SizedBox(height: 10),
              DrawerButton(
                label: 'Customers',
                iconData: Icons.people_alt,
                onPressed: () {
                  changeIndex(4);
                },
                isSelected: widget.tabController.index == 4,
              ),
              const SizedBox(height: 10),
              DrawerButton(
                label: 'Change Password',
                iconData: Icons.inventory_2_outlined,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ChangePasswordDialog(),
                  );
                },
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function() onPressed;
  final bool isSelected;
  const DrawerButton({
    super.key,
    required this.label,
    required this.iconData,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? drawerButtonFillColor : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: borderColor,
        ),
      ),
      child: InkWell(
        onTap: isSelected ? null : onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: isSelected
                    ? drawerButtonActiveIconColor
                    : drawerButtonIconColor,
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: isSelected
                          ? drawerButtonActiveLabelColor
                          : drawerButtonLabelColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
