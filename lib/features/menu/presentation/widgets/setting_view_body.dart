import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/menu/presentation/widgets/menu_tabs.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  String selectedLang = 'English';
  bool isOn = false;
  List<String> othersIconsList = [
    'assets/icons/Privacy.svg',
    'assets/icons/Message.svg',
    'assets/icons/Document.svg',
  ];
  List<String> othersTitlesList = [
    'Privacy Policy',
    'Customer Support',
    'Terms & Conditions',
  ];
  List<String> othersNavigationPaths = [
    AppRoutes.settings,
    AppRoutes.settings,
    AppRoutes.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              leading: AppBackButton(),
              title: Text('Settings', style: context.exTextStyles.large),
            ),
            SizedBox(height: 12),
            Text('General', style: context.exTextStyles.small600),
            MenuTab(
              navigationPath: AppRoutes.settings,
              prefIconLink: 'assets/icons/Change.svg',
              title: 'Switch Account',
            ),
            MenuTab(
              onTap: () async {
                final result =
                    await context.push(AppRoutes.chooseLang)
                        as Map<String, dynamic>;

                if (result['lang'] != null) {
                  setState(() {
                    selectedLang = result['lang'];
                  });
                }
              },
              navigationPath: AppRoutes.chooseLang,
              prefIconLink: 'assets/icons/Language.svg',
              title: 'Language',
              customSuffix: Row(
                children: [
                  Text(selectedLang, style: context.exTextStyles.medium400),
                  SvgPicture.asset(
                    'assets/icons/Arrow right.svg',
                    colorFilter: ColorFilter.mode(
                      context.exColors.grey400,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: context.exColors.grey50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 12,
                children: [
                  SvgPicture.asset('assets/icons/Dark mode.svg'),
                  Text('Dark mode', style: context.exTextStyles.medium400),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOn = !isOn;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.exColors.grey0,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: context.exColors.grey200),
                      ),
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 250),
                        alignment: isOn
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: isOn
                                ? context.exColors.primary600
                                : context.exColors.grey400,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Text('Others', style: context.exTextStyles.small600),
            ...List.generate(
              3,
              (index) => MenuTab(
                navigationPath: othersNavigationPaths[index],
                prefIconLink: othersIconsList[index],
                title: othersTitlesList[index],
              ),
            ),
            Text('Danger Actions', style: context.exTextStyles.small600),
            MenuTab(
              navigationPath: AppRoutes.deleteAcc,
              prefIconLink: 'assets/icons/Delete.svg',
              title: 'Delete Account',
            ),
            MenuTab(
              navigationPath: '',
              onTap: () {
                context.read<AuthCubit>().logOutC();
                GoRouter.of(context).go(AppRoutes.startAuth);
              },
              prefIconLink: 'assets/icons/Log out.svg',
              title: 'Log out',
            ),
          ],
        ),
      ),
    );
  }
}
