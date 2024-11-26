import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/utils/app_color.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/features/auth/data/model/onborder_model.dart';

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
                                child: TextButton(
                                  onPressed: () {
                                    controller.jumpToPage(
                                      2,
                                    );
                                  },
                                  child: Text(
                                    AppString.skip,
                                    style: TextStyle(
                                      fontFamily: GoogleFonts.lato().fontFamily,
                                      fontSize: 16,
                                      color: AppColor.secondaryColor
                                          .withOpacity(0.44),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 47,
                              ),
                        const SizedBox(
                          height: 16,
                        ),
                        //image
                        Image.asset(
                          OnborderModel.onborderList[index].image,
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        //donts
                        SmoothPageIndicator(
                            controller: controller,
                            count: OnborderModel.onborderList.length,
                            effect: ExpandingDotsEffect(
                              dotColor:
                                  AppColor.secondaryColor.withOpacity(0.44),
                              activeDotColor: AppColor.primaryColor,
                              dotHeight: 8,
                              dotWidth: 20,
                              spacing: 4,
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        //title
                        Text(
                          OnborderModel.onborderList[index].title,
                          style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //description
                        Text(
                          OnborderModel.onborderList[index].subtitle,
                          style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                        // buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index != 0
                                ? TextButton(
                                    onPressed: () {
                                      controller.previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: Text(
                                      AppString.back,
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.lato().fontFamily,
                                        fontSize: 16,
                                        color: AppColor.secondaryColor
                                            .withOpacity(0.44),
                                      ),
                                    ),
                                  )
                                : Container(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () {
                                if (index == 2) {
                                } else {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                }
                              },
                              child: Text(
                                index != 2
                                    ? AppString.next
                                    : AppString.getstarted,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.secondaryColor,
                                ),
                              ),
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
