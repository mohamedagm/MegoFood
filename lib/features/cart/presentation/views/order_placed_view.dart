import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';

class OrderPlacedView extends StatefulWidget {
  const OrderPlacedView({super.key});

  @override
  State<OrderPlacedView> createState() => _OrderPlacedViewState();
}

class _OrderPlacedViewState extends State<OrderPlacedView> {
  List<String> icons = [
    'assets/icons/Clock.svg',
    'assets/icons/Location.svg',
    'assets/icons/Credit Card.svg',
  ];
  List<String> activity = ['Estimated time', 'Deliver to', 'Amount Paid'];
  List<String> info = ['30mins', 'Home', r'$32.12'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 10,
            children: [
              CustomHeader(
                leading: SvgPicture.asset(
                  'assets/icons/Close.svg',
                  width: 32,
                  height: 32,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/GreenCheck filled.svg',
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Yay! Your order\nhas been placed.',
                    style: context.exTextStyles.heading1,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Your order would be delivered in the\n30 mins atmost',
                    style: context.exTextStyles.medium400,
                  ),
                ],
              ),
              SizedBox(),
              ...List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          SvgPicture.asset(
                            icons[index],
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              context.exColors.grey500,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            activity[index],
                            style: context.exTextStyles.medium.copyWith(
                              color: context.exColors.typography300,
                            ),
                          ),
                        ],
                      ),
                      Text(info[index], style: context.exTextStyles.medium),
                    ],
                  ),
                ),
              ),
              Spacer(),
              AppElevatedButton(
                buttonType: AppButtonType.primary,
                onPressed: () {
                  //GoRouter.of(context).push(AppRoutes);
                },
                child: Text('Track my order'),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
