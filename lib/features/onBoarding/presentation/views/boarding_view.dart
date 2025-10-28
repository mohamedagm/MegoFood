import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/features/onBoarding/data/model/onboarding_model.dart';

class BoardingView extends StatefulWidget {
  const BoardingView({super.key});

  @override
  State<BoardingView> createState() => _BoardingViewState();
}

class _BoardingViewState extends State<BoardingView> {
  PageController? controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: BoardingViewBody(controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoardingViewBody extends StatelessWidget {
  const BoardingViewBody({super.key, required this.controller});

  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: List.generate(
        3,
        (index) => Column(
          children: [
            Image.asset('assets/images/mego.png'),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  SvgPicture.asset('assets/images/Vector_bg.svg'),
                  SvgPicture.asset(onboardingPages[index].image),
                ],
              ),
            ),

            Text(onboardingPages[index].title, textAlign: TextAlign.center),
            Text(onboardingPages[index].subTitle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
