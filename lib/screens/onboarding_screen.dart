import 'package:cashpilot_money_controller/constants/colors.dart';
import 'package:cashpilot_money_controller/data/onboarding_data.dart';
import 'package:cashpilot_money_controller/screens/onboarding/front_page.dart';
import 'package:cashpilot_money_controller/screens/onboarding/shared_onboarding.dart';
import 'package:cashpilot_money_controller/screens/userdata_screen.dart';
import 'package:cashpilot_money_controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  //page controller
  final PageController _controller = PageController();
  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                //onboarding screens
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnboarding(
                      title: OnboardingData.onboardingData[0].title,
                      imagePath: OnboardingData.onboardingData[0].imagePath,
                      description: OnboardingData.onboardingData[0].description,
                    ),
                    SharedOnboarding(
                      title: OnboardingData.onboardingData[1].title,
                      imagePath: OnboardingData.onboardingData[1].imagePath,
                      description: OnboardingData.onboardingData[1].description,
                    ),
                    SharedOnboarding(
                      title: OnboardingData.onboardingData[2].title,
                      imagePath: OnboardingData.onboardingData[2].imagePath,
                      description: OnboardingData.onboardingData[2].description,
                    )
                  ],
                ),

                //page dot indicator
                Container(
                  alignment: Alignment(0, 0.65),
                  child: SmoothPageIndicator(
                    controller: _controller, 
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrayColor
                    ),
                  )
                ),

                //navigation button
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,),
                    child: !showDetailsPage ? GestureDetector(
                      onTap: () {
                        _controller.animateToPage(
                          _controller.page!.toInt()+1, 
                          duration: Duration(microseconds: 400), 
                          curve: Curves.easeInOut);
                      },
                      child: CustomButton(
                        buttonName: showDetailsPage ? "Get Started" : "Next", 
                        buttonColor: kMainColor,
                      )
                    ) :  GestureDetector(
                      onTap: () {
                        //navigate to the userdata screen
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserdataScreen()));
                      },
                      child: CustomButton(
                        buttonName: showDetailsPage ? "Get Started" : "Next", 
                        buttonColor: kMainColor,
                      )
                    )
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}