import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/core/widgets/cancel_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/core/widgets/save_button.dart';

class AddCouponView extends StatefulWidget {
  const AddCouponView({super.key});

  @override
  State<AddCouponView> createState() => _AddCouponViewState();
}

class _AddCouponViewState extends State<AddCouponView> {
  TextEditingController controller = TextEditingController();
  int curIndexCoupon = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                CustomHeader(
                  leading: CancelButton(),
                  title: Text('Add Coupon', style: context.exTextStyles.large),
                  actions: [
                    SaveButton(data: {'coupon': 'PIZAA10'}),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: controller,
                        hintText: 'type coupon name',
                        onChanged: (value) => setState(() {}),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: AppElevatedButton(
                        buttonType: controller.text.isEmpty
                            ? AppButtonType.disabled
                            : AppButtonType.primary,
                        onPressed: () {},
                        child: Text('add'),
                      ),
                    ),
                  ],
                ),
                Divider(color: context.exColors.grey200),
                Text('Select from these', style: context.exTextStyles.small600),
                ...List.generate(
                  4,
                  (index) => GestureDetector(
                    onTap: () => setState(() {
                      curIndexCoupon = index;
                    }),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: context.exColors.grey50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PIZZA10',
                                style: context.exTextStyles.small600,
                              ),
                              Text(
                                'Get 10% off on any pizza order.',
                                style: context.exTextStyles.medium400,
                              ),
                            ],
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: context.exColors.grey100,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: curIndexCoupon == index
                                    ? context.exColors.primary600
                                    : context.exColors.grey200,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: curIndexCoupon == index
                                      ? context.exColors.primary600
                                      : null,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
