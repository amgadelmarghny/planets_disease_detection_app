import 'package:flutter/material.dart';

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
            'Orange',
          ),
        ],
      ),
    );
  }
}
