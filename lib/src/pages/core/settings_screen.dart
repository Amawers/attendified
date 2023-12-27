import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onTapSignOut(context);
          },
          child: const Text('SignOut'),
        ),
      ),
    );
  }
}

Future<void> onTapSignOut(context) async {
  await Supabase.instance.client.auth.signOut();
  if (context.mounted) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
