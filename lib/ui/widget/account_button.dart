import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../values/color.dart';
import '../screen/login_screen.dart';
import 'custom_alert_dialog.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Text(
            'ADMIN',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appBarIconColor,
                ),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'LOGOUT?',
                  description: 'Are you sure you want to logout?',
                  primaryButton: 'LOGOUT',
                  onPrimaryPressed: () async {
                    await Supabase.instance.client.auth.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  secondaryButton: 'NO',
                ),
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
              size: 20,
              color: appBarIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
