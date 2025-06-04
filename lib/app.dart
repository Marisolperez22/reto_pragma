import 'package:flutter/material.dart';
import 'config/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Reto PRAGMA',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}