import 'package:flutter/material.dart';
import 'package:planet_app/layout/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEFFE7),
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: const HomeViewBody(),
    );
  }
}
