import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/database/cached_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/utils/navigate_helper.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/features/auth/data/model/onborder_model.dart';
import 'package:to_do_app/features/task/presentation/views/home/home_view.dart';

class OnborderingScreens extends StatefulWidget {
  const OnborderingScreens({super.key});

  @override
  State<OnborderingScreens> createState() => _OnborderingScreensState();
}

PageController controller = PageController();

class _OnborderingScreensState extends State<OnborderingScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        index != 2
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: CustomTextButton(
                                    text: AppString.skip,
                                    onPressed: () {
                                      controller.jumpToPage(
                                        2,
                                      );
                                    }),
                              )
                            : SizedBox(
                                height: 47.h,
                              ),
                        SizedBox(
                          height: 16.h,
                        ),
                        //image
                        Image.asset(
                          OnborderModel.onborderList[index].image,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),

                        //donts
                        SmoothPageIndicator(
                            controller: controller,
                            count: OnborderModel.onborderList.length,
                            effect: ExpandingDotsEffect(
                              dotColor:
                                  AppColor.secondaryColor.withOpacity(0.44),
                              activeDotColor: AppColor.primaryColor,
                              dotHeight: 8.h,
                              dotWidth: 20.w,
                              spacing: 4,
                            )),
                        SizedBox(
                          height: 50.h,
                        ),
                        //title
                        Text(
                          OnborderModel.onborderList[index].title,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        //description
                        Text(
                          OnborderModel.onborderList[index].subtitle,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                        // buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index != 0
                                ? CustomTextButton(
                                    text: AppString.back,
                                    onPressed: () {
                                      controller.previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    })
                                : Container(),
                            CustomElevatedButton(
                              index: index,
                              onPressed: () {
                                if (index == 2) {
                                  getIt<CachedHelper>()
                                      .savedata(
                                          key: AppString.onBoardingKey,
                                          value: true)
                                      .then((value) {
                                    context.navigateTo(
                                      const HomeView(),
                                    );
                                    print('onbordering $value');
                                  });
                                } else {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
              //skip button
            ],
          ),
        ),
      ),
    );
  }
}
