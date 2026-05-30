import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_shimmer.dart';
import 'package:mego_food/features/category_restaurants/data/models/category_restaurants_args.dart';
import 'package:mego_food/features/home/presentation/cubit/home_cubit.dart';
import 'package:mego_food/features/home/presentation/cubit/home_state.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  late PageController controller;
  late Timer timer;
  int curPage = 100;
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.4, initialPage: 100);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        if (!mounted || !controller.hasClients) return;

        curPage++;

        controller.animateToPage(
          curPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.categoriesStatus == RequestStatus.loading) {
          return SizedBox(
            height: 45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => ShimmerBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.4,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }

        if (state.categoriesStatus == RequestStatus.success) {
          if (state.categories.isEmpty) return const SizedBox();

          return SizedBox(
            height: 45,
            child: PageView.builder(
              onPageChanged: (value) {
                curPage = value;
              },
              controller: controller,
              itemBuilder: (context, index) {
                final realIndex = index % state.categories.length;
                final category = state.categories[realIndex];

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRoutes.categoryRestaurants,
                        extra: CategoryRestaurantsArgs(
                          categoryId: category.id,
                          categoryName: category.name,
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.exColors.grey200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        category.name,
                        style: context.exTextStyles.robotoLarge,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (state.categoriesStatus == RequestStatus.failure) {
          return Text(state.categoriesError ?? 'Error');
        }

        return const SizedBox();
      },
    );
  }
}

// التركايه الجامده هنا فين ؟
// انت عايز انفينيت اسكرول يباشا
// علطول متزموش بليميت يا حبيبي يعني متديش للست فيو ايتم كاونت
// بس مش دي التركايه
// التركايه بجد هتعرض 8 9 عناصر ازاي لا نهائي ؟؟ وهنا تتدخل تركاية جميله
// الا وهي معايا شوية اندكس وعايز اكررهم يبيييه
// يبقي عليك وعلي باقي القسمه الجميل وبعمليه بسيطه بناءا عليها تعرض انهي اندكس
// وكلهم تحت مظلة ال كام انكدس بتوعك يجمالو
// realIndex = index % demoData.length;
// هنا هنفضل نعد من 0 ل لينث الليست
// متعة الرياضه وجمدان ال بروبلم سولفنج حرفيا هيا لوب الحل
// الباقي تحريك وكلام كدا لذوذ برضو بس حتة اللوجيك دي هي الاساسا
