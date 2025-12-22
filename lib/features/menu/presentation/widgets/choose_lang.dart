import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/cancel_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/core/widgets/save_button.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({super.key});

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  List<String> langName = ['English', 'Arabic', 'French', 'Korean'];
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 12,
            children: [
              CustomHeader(
                leading: CancelButton(),
                title: Text('Language', style: context.exTextStyles.large),
                actions: [
                  SaveButton(data: {'lang': langName[curIndex]}),
                ],
              ),
              ...List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () => setState(() {
                    curIndex = index;
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                              langName[index],
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
    );
  }
}
