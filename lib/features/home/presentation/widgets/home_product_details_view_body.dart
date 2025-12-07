import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
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
  int count = 1;
  bool readMore = true;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(),
                  Row(
                    spacing: 20,
                    children: [
                      SvgPicture.asset('assets/icons/Share.svg'),
                      SvgPicture.asset(
                        'assets/icons/Like filled.svg',
                        colorFilter: ColorFilter.mode(
                          context.exColors.red,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //pageView
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: PageView(
                  onPageChanged: (value) {},
                  controller: controller,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/pizaa.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.exColors.grey200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Star filled.svg',
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                            context.exColors.yellow,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text("4.8", style: context.exTextStyles.medium),
                      ],
                    ),

                    // Divider
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      width: 1,
                      height: 20,
                      color: Colors.grey.shade300,
                    ),

                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Fire filled.svg',
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                            context.exColors.orange,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text("300kcal", style: context.exTextStyles.medium),
                      ],
                    ),

                    // Divider
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      width: 1,
                      height: 20,
                      color: Colors.grey.shade300,
                    ),

                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Clock filled.svg',
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                            context.exColors.blue,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text("20mins", style: context.exTextStyles.medium),
                      ],
                    ),
                  ],
                ),
              ),
              //name + count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Pepperoni Cheese\nPizza',
                      style: context.exTextStyles.large,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: context.exColors.grey100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => setState(() {
                            count++;
                          }),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.exColors.grey100,
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                        Text(
                          '$count',
                          style: context.exTextStyles.robotoMedium,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            if (count > 1) count--;
                          }),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.exColors.grey100,
                            ),
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //desc
              GestureDetector(
                onTap: () => setState(() {
                  readMore = true;
                }),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A classic favorite! Indulge in a crispy, thin crust topped with rich tomato sauce, layers of gooey mozzarella cheese, and delicious pepperoni slices. Perfectly baked with a hint of herbs for a mouth-watering experience in every bite.',
                      style: context.exTextStyles.small,
                      maxLines: readMore ? 2 : 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    if (readMore)
                      GestureDetector(
                        onTap: () => setState(() {
                          readMore = false;
                        }),
                        child: Text(
                          'Read more...',
                          style: context.exTextStyles.small600,
                        ),
                      ),
                    if (readMore)
                      Container(
                        width: 85,
                        height: 3,
                        decoration: BoxDecoration(
                          color: context.exColors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                  ],
                ),
              ),
              //price+AddToCart
              Row(
                spacing: 30,
                children: [
                  Text(r'$12.99', style: context.exTextStyles.robotoHeading),
                  Expanded(
                    child: AppElevatedButton(
                      buttonType: AppButtonType.primary,
                      onPressed: () {},
                      child: Text('Add to card'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
