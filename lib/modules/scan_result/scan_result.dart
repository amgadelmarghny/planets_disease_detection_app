import 'dart:io';
import 'package:flutter/material.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({super.key});
  static const String routeName = '/scan_result';
  @override
  Widget build(BuildContext context) {
    final File resultImage = ModalRoute.of(context)!.settings.arguments as File;
    return Scaffold(
      body: Column(
        children: [
          Image.file(resultImage),
        ],
      ),
    );
  }
}
