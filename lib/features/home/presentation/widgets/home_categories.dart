import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  List<String> demoData = List.generate(8, (index) => ('category $index'));
  late PageController controller;
  late Timer timer;
  int curPage = 100;
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.4, initialPage: 100);
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      curPage += 1;
      controller.animateToPage(
        curPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
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
    return SizedBox(
      height: 45,
      child: PageView.builder(
        onPageChanged: (value) {
          curPage = value;
        },
        controller: controller,
        itemBuilder: (context, index) {
          final realIndex = index % demoData.length;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.exColors.grey200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                demoData[realIndex],
                style: context.exTextStyles.robotoLarge,
              ),
            ),
          );
        },
      ),
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