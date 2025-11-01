import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/onBoarding/presentation/widgets/boarding_view_body.dart';
import 'package:mego_food/features/onBoarding/presentation/widgets/boarding_view_bottom.dart';

class BoardingView extends StatefulWidget {
  const BoardingView({super.key});

  @override
  State<BoardingView> createState() => _BoardingViewState();
}

class _BoardingViewState extends State<BoardingView> {
  PageController? controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              spacing: 15,
              children: [
                Image.asset(AppAssets.mego),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: BoardingViewBody(
                    controller: controller,
                    onPageChanged: (index) => setState(() {
                      currentIndex = index;
                    }),
                  ),
                ),
                BoardingViewBottom(
                  controller: controller,
                  onNextPressed: () => currentIndex == 2
                      ? GoRouter.of(context).push(AppRoutes.startAuth)
                      : controller!.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
