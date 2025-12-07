import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/home/presentation/widgets/product_count.dart';
import 'package:mego_food/features/home/presentation/widgets/product_desc.dart';
import 'package:mego_food/features/home/presentation/widgets/product_details_header.dart';
import 'package:mego_food/features/home/presentation/widgets/product_details_footer.dart';
import 'package:mego_food/features/home/presentation/widgets/product_info_bar.dart';
import 'package:mego_food/features/home/presentation/widgets/product_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeProductDetailsViewBody extends StatefulWidget {
  const HomeProductDetailsViewBody({super.key});

  @override
  State<HomeProductDetailsViewBody> createState() =>
      _HomeProductDetailsViewBodyState();
}

class _HomeProductDetailsViewBodyState
    extends State<HomeProductDetailsViewBody> {
  PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 16,
            children: [
              //header
              ProductDetailsHeader(),
              //pageView
              ProductPageView(controller: controller),
              //indicator
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: SwapEffect(
                  spacing: 8.0,
                  dotWidth: 12.0,
                  dotHeight: 12.0,
                  strokeWidth: 1.5,
                  dotColor: context.exColors.primary200,
                  activeDotColor: context.exColors.primary600,
                ),
              ),
              //info bar
              ProductInfoBar(),
              //name + count
              ProductCount(),
              //desc
              ProductDesc(),
              //price+AddToCart
              ProductDetailsFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
