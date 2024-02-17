import 'package:bloc/bloc.dart';
import 'package:planet_app/models/on_boarding_model.dart/on_boarding_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: 'lib/asset/image/onBoarding_screen1.png',
      firstTitle: 'Health check',
      secondTitle: 'Detect plant disease',
    ),
    OnBoardingModel(
      image: 'lib/asset/image/onBoarding_screen2.png',
      firstTitle: 'Scan plant to detect',
      secondTitle: 'disease instantly',
    ),
    OnBoardingModel(
      image: 'lib/asset/image/onBoarding_screen3.png',
      firstTitle: 'Receive a disease',
      secondTitle: 'diagnoses and fertilizer',
      therdTitle: 'recommendations',
    ),
  ];
  int onBoardingPageNum = 0;
  void changeOnBoard(int index) {
    onBoardingPageNum = index;
    emit(OnBoardingState());
  }
}
