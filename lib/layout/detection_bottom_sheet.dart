import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planet_app/modules/scan_result/scan_result.dart';
import 'package:planet_app/shared/componants/custom_button.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class DetextionOptions extends StatefulWidget {
  const DetextionOptions({
    super.key,
  });

  @override
  State<DetextionOptions> createState() => _DetextionOptionsState();
}

class _DetextionOptionsState extends State<DetextionOptions> {
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Detection of the plant infection',
            style: FontsClass.font20bold,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Choose from Gallery',
            onTap: selectImageFromGallery,
          ),
          const SizedBox(height: 40),
          CustomButton(
            text: 'Choose from Camera',
            onTap: selectImageFromCamera,
          ),
        ],
      ),
    );
  }

  Future selectImageFromCamera() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'lib/asset/image/rotate phone to horizontal.png',
              height: 100,
            ),
            const Text(
              'Reverse phone',
              style: FontsClass.font20think,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final returnImage =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (!context.mounted) return;
              if (returnImage == null) return Navigator.pop(context);
              setState(() {
                _pickedImage = File(returnImage.path);
                Navigator.pushNamed(
                  context,
                  ScanResult.routeName,
                  arguments: _pickedImage,
                );
              });
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future selectImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      _pickedImage = File(returnImage.path);
      Navigator.pushNamed(
        context,
        ScanResult.routeName,
        arguments: _pickedImage,
      );
    });
  }
}
