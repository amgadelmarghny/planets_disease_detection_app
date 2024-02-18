import 'package:flutter/material.dart';
import 'package:planet_app/shared/componants/back_icon/back_icon.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackIcon(),
        centerTitle: true,
        title:  Text(
          'my plants',
          style: FontsClass.font32bold,
        ),
      ),
      body: Center(
        
      ),
    );
  }
}
