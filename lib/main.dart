import 'package:attendified/src/pages/common/bottom_navbar_widget.dart';
import 'package:attendified/src/pages/creating_class/create_class.dart';
import 'package:attendified/src/pages/core/dashboard_screen.dart';
import 'package:attendified/src/pages/authentication/login_screen.dart';
import 'package:attendified/src/pages/authentication/signup_screen.dart';
import 'package:attendified/src/pages/core/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ofdooextqdgxsxgdjija.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9mZG9vZXh0cWRneHN4Z2RqaWphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI2OTE4MzAsImV4cCI6MjAxODI2NzgzMH0.okQmwWYQ_oN31TcZfF0pOW9JYB6H2qqCGZ5_HuTppQI',
    authFlowType: AuthFlowType.pkce,
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Supabase Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.green,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
            ),
          ),
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (_) => SplashScreen(),
          '/login': (_) => const LogInScreen(),
          '/signup': (_) => SignupScreen(),
          '/dashboard': (_) => DashboardScreen(),
          '/bottom_navbar': (_) => BottomNavBar(),
          '/class_list': (_) => ClassList()
        });
  }
}
