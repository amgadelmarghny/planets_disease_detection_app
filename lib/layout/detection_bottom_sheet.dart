import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/shared/bloc/plant_cubit/plant_cubit.dart';
import 'package:planet_app/shared/components/custom_button.dart';
import 'package:planet_app/shared/components/flutter_toast.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class DetectionOptions extends StatelessWidget {
  const DetectionOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantCubit, PlantState>(
      listener: (context, state) {
        if (state is PickImageFailureState) {
          showToast(msg: state.errMessage, toastState: ToastState.worrning);
          Navigator.pop(context);
        }
        if(state is PickImageSuccessState){
          //TODO: what will happen?
        }
      },
      builder: (context, state) {
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
                onTap: ()  async {
                  await BlocProvider.of<PlantCubit>(context)
                      .pickImageFromGallery();
                },
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Choose from Camera',
                onTap: () {
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
                            await BlocProvider.of<PlantCubit>(context)
                                .pickImageFromCamera();
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
