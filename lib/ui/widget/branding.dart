import 'package:flutter/material.dart';

class Branding extends StatelessWidget {
  final double height;
  const Branding({
    super.key,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: height,
        color: Colors.grey,
      ),
    );
  }
}
