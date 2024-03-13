import 'dart:io';
import 'package:flutter/material.dart';
import 'package:planet_app/modules/scan_result/custom_row_direction.dart';
import 'package:planet_app/modules/scan_result/custom_row_successfull_disease.dart';
import 'package:planet_app/shared/style/colors/colors_style.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({super.key});
  static const String routeName = '/scan_result';
  @override
  Widget build(BuildContext context) {
    final File resultImage = ModalRoute.of(context)!.settings.arguments as File;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              width: MediaQuery.of(context).size.height,
              child: Image.file(
                fit: BoxFit.fill,
                resultImage,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomRowSuccessfulDisease(),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'PLANT NAME',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Disease name',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: FontsClass.font20bold.copyWith(fontSize: 23),
                  ),
                  Text(
                    'Symptoms oh phoma leaf blight infection are only seen on older leaves. Affected leaves show irregular, angular, yellow to brown lesions scattered across the lamina. As the disease progress, the lesions grow and form larger ....',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey, height: 1.1, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.6,
                  ),
                  const SizedBox(height: 20),
                  const CustomRowDirections(
                    svgPic: 'lib/asset/image/shield-check.svg',
                    title: 'Mitigation',
                    subTitle:
                        'Clean the plant\'s environment regularly to avoid moisture growth',
                    color: Color(0xff3B70CF),
                    primaryColor: Color(0xffE6EAFA),
                  ),
                  const SizedBox(height: 20),
                  const CustomRowDirections(
                    title: 'Medicine',
                    image: 'lib/asset/image/medicine_bottle.png',
                    subTitle: 'Fungicide spraying, followed by miltox 0.3%',
                    color: defaultColor,
                    primaryColor: Color(0xffEEF7E8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
