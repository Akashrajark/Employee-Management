import 'package:employee_manager/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'ui/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vicjyqiphgkrcikalutr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZpY2p5cWlwaGdrcmNpa2FsdXRyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTgzMTE1MTAsImV4cCI6MjAxMzg4NzUxMH0.tRQRGniymr0zyok3X1BueA8tbLzy74WFleUck9hXYmc',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management',
      theme: appTheme,
      home: const LoginScreen(),
    );
  }
}
