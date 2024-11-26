import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class OnborderModel {
  final String title;
  final String subtitle;
  final String image;

  OnborderModel({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  static List<OnborderModel> onborderList = [
    OnborderModel(
      title: AppString.onBoardingTitile1,
      subtitle: AppString.onBoardingDesc1,
      image: AppAssets.onborder1,
    ),
    OnborderModel(
      title: AppString.onBoardingTitile2,
      subtitle: AppString.onBoardingDesc2,
      image: AppAssets.onborder2,
    ),
    OnborderModel(
      title: AppString.onBoardingTitile3,
      subtitle: AppString.onBoardingDesc3,
      image: AppAssets.onborder3,
    ),
  ];
}
