import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/modules/scan_result/custom_row_successfull_disease.dart';
import 'package:planet_app/shared/bloc/plant_cubit/plant_cubit.dart';
import '../../../shared/style/colors/colors_style.dart';
import '../../../shared/style/fonts/font_style.dart';
import '../custom_row_direction.dart';

class SuccessResultScreen extends StatelessWidget {
  const SuccessResultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlantCubit>();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              width: MediaQuery.of(context).size.height,
              child: Image.file(
                fit: BoxFit.fill,
                cubit.plantImage,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomRowSuccessfulDisease(
                    success: true,
                  ),
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
                          '${cubit.plantResultModel!.plant}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey, fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Predicted class',
                    style: FontsClass.font20bold.copyWith(fontSize: 23),
                  ),
                  Text(
                    '${cubit.plantResultModel!.predictedClass}',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          height: 1.1,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description:',
                    style: FontsClass.font20bold.copyWith(fontSize: 23),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Disease Number',
                    style: FontsClass.font20think.copyWith(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    '${cubit.plantResultModel!.diseaseInfo!.disease}',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          height: 1.1,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Disease Name',
                    style: FontsClass.font20think.copyWith(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    '${cubit.plantResultModel!.diseaseInfo!.arabicName}',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          height: 1.1,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Pathogen',
                    style: FontsClass.font20think.copyWith(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    '${cubit.plantResultModel!.diseaseInfo!.pathogen}',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          height: 1.1,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Control methods',
                    style: FontsClass.font20think.copyWith(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    '${cubit.plantResultModel!.diseaseInfo!.controlMethods?.map((v) {
                      return v;
                    })}',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          height: 1.1,
                          fontSize: 16,
                        ),
                  ),
                  if (cubit.plantResultModel!.diseaseInfo!.symptoms != null)
                    if (cubit
                        .plantResultModel!.diseaseInfo!.symptoms!.isNotEmpty)
                      const SizedBox(
                        height: 8,
                      ),
                  if (cubit.plantResultModel!.diseaseInfo!.symptoms != null)
                    if (cubit
                        .plantResultModel!.diseaseInfo!.symptoms!.isNotEmpty)
                      Text(
                        'symptoms',
                        style: FontsClass.font20think.copyWith(
                          fontSize: 19,
                        ),
                      ),
                  if (cubit.plantResultModel!.diseaseInfo!.symptoms != null)
                    if (cubit
                        .plantResultModel!.diseaseInfo!.symptoms!.isNotEmpty)
                      Text(
                        '${cubit.plantResultModel!.diseaseInfo!.symptoms!.map((v) {
                          return v + '\n';
                        })}',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              height: 1.1,
                              fontSize: 16,
                            ),
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
