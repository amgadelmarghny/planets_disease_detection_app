import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'my plants',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: PlantItem(),
        ),
      ),
    );
  }
}

class PlantItem extends StatelessWidget {
  const PlantItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            'lib/asset/image/orange.png',
          ),
          const Text(
            'bodjr',
          ),
        ],
      ),
    );
  }
}
