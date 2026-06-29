import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discussify/theme/app_theme.dart';
import 'package:discussify/admin/presentation/view/admin_screen.dart';
import 'package:discussify/user/presentation/view/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://lmcobqjifipansmmwewd.supabase.co',
    publishableKey: 'sb_publishable_dfwKydtsYFLG581JjSsFag_Qjx7Vth7',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Discussify',
      theme: AppTheme.lightTheme,
      home: AdminScreen(),
      getPages: [
        GetPage(name: '/admin', page: () => AdminScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
