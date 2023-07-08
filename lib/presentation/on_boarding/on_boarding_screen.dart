import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut_app/data/model/onboarding_model.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/dummyu_strings.dart';
import 'package:tut_app/presentation/resources/fonts_manager.dart';
import 'package:tut_app/presentation/resources/style_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageViewController = PageController();
  int currentIndex = 0;
  List<OnboardingModel> onBoarding = [
    OnboardingModel(
      DummyuStrings.onBoardingTitle1,
      DummyuStrings.onBoardingDescription1,
      ImageAssets.onBoarding1,
    ),
    OnboardingModel(
      DummyuStrings.onBoardingTitle2,
      DummyuStrings.onBoardingDescription2,
      ImageAssets.onBoarding2,
    ),
    OnboardingModel(
      DummyuStrings.onBoardingTitle3,
      DummyuStrings.onBoardingDescription3,
      ImageAssets.onBoarding3,
    ),
    OnboardingModel(
      DummyuStrings.onBoardingTitle4,
      DummyuStrings.onBoardingDescription4,
      ImageAssets.onBoarding4,
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: ColorManager.primary,
        ),
      ),
      body: PageView.builder(
        controller: pageViewController,
        itemCount: onBoarding.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
            print(currentIndex);
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingBuilder(onBoarding[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.primary,
        height: 75,
        width: double.infinity,
        child: FooterBuilder(
          pageController: pageViewController,
          cIndex: currentIndex,
        ),
      ),
    );
  }
}

class OnBoardingBuilder extends StatelessWidget {
  final OnboardingModel? onboardingModel;
  const OnBoardingBuilder(this.onboardingModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Text(
            onboardingModel!.headLine,
            style: getBoldStyle(
              color: ColorManager.darkGrey,
              fontSize: FontSize.s22,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppSize.s20),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Text(
            onboardingModel!.descryption,
            textAlign: TextAlign.center,
            style: getLightStyle(
              color: ColorManager.grey,
              fontSize: FontSize.s18,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s40),
        const SizedBox(
          width: 250,
          height: 250,
          child: Image(
            image: AssetImage(
              ImageAssets.splashLogo,
            ),
            fit: BoxFit.fill,
          ),
        ),
        Spacer(),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppMargin.m14),
              child: Text(
                'skip',
                style: getBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s22),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

class FooterBuilder extends StatefulWidget {
  int cIndex;
  PageController pageController;
  FooterBuilder(
      {required this.pageController, required this.cIndex, super.key});

  @override
  State<FooterBuilder> createState() => _FooterBuilderState(
        cIndex: cIndex,
        pageController: pageController,
      );
}

class _FooterBuilderState extends State<FooterBuilder> {
  int cIndex;
  PageController pageController;

  _FooterBuilderState({
    required this.pageController,
    required this.cIndex,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (cIndex > 0) {
              print(cIndex);

              setState(() {
                cIndex--;
                pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              });
            }
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.white,
          ),
        ),
        const Spacer(),
        cIndex == 0
            ? IndicatorBuilder(ColorManager.primary, true)
            : IndicatorBuilder(ColorManager.white, false),
        cIndex == 1
            ? IndicatorBuilder(ColorManager.primary, true)
            : IndicatorBuilder(ColorManager.white, false),
        cIndex == 2
            ? IndicatorBuilder(ColorManager.primary, true)
            : IndicatorBuilder(ColorManager.white, false),
        cIndex == 3
            ? IndicatorBuilder(ColorManager.primary, true)
            : IndicatorBuilder(ColorManager.white, false),
        const SizedBox(
          width: 100,
        ),
        IconButton(
          onPressed: () {
            if (cIndex < 3) {
              print(cIndex);
              setState(() {
                cIndex++;
                pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              });
            }
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: ColorManager.white,
          ),
        ),
      ],
    );
  }
}

Widget? indicators({required cuIndex}) {
  for (int i = 0; i < 3; i++) {
    if (i != cuIndex) {
      return IndicatorBuilder(ColorManager.white, false);
    } else {
      IndicatorBuilder(ColorManager.primary, true);
    }
  }
}

class IndicatorBuilder extends StatelessWidget {
  const IndicatorBuilder(this.indicatorColor, this.isSelected, {super.key});
  final Color indicatorColor;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: indicatorColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? ColorManager.white : ColorManager.white,
            )),
      ),
    );
  }
}
