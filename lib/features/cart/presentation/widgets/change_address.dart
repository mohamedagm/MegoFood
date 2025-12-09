import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/cancel_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/core/widgets/save_button.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({super.key});

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  int curIndex = 0;
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
                  title: Text(
                    'Change address',
                    style: context.exTextStyles.large,
                  ),
                  actions: [SaveButton()],
                ),
                ...List.generate(
                  2,
                  (index) => GestureDetector(
                    onTap: () => setState(() {
                      curIndex = index;
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
                                'Home',
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
                                color: curIndex == index
                                    ? context.exColors.primary600
                                    : context.exColors.grey200,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: curIndex == index
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
