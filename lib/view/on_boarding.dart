import 'package:arun_final_project/data/color.dart';
import 'package:arun_final_project/model/onboarding_model.dart';
import 'package:arun_final_project/view/log_in.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int pageNo = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: pageNo == onBoardingList.length - 1
                  ? const SizedBox()
                  : TextButton(
                      onPressed: () {
                        pageController.animateToPage(onBoardingList.length - 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: AppColor.backGround2),
                      ),
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    pageNo = value;
                  });
                },
                controller: pageController,
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(onBoardingList[index].image),
                        Text(
                          onBoardingList[index].category,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          onBoardingList[index].description,
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                dotColor: AppColor.backGround3,
                activeDotColor: AppColor.backGround2,
                dotHeight: 5,
              ),
              controller: pageController,
              count: onBoardingList.length,
            ),
            const SizedBox(height: 20),
            pageNo == onBoardingList.length - 1
                ? MaterialButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return LogIn();
                        },
                      ), (route) => false);
                    },
                    color: AppColor.backGround2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text('Get Started'),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
