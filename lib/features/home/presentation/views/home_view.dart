import 'package:flutter/material.dart';
import 'package:mego_food/features/cart/presentation/views/cart_view.dart';
import 'package:mego_food/features/explore/presentation/views/explore_view.dart';
import 'package:mego_food/features/home/presentation/views/custom_bottom_nav.dart';
import 'package:mego_food/features/home/presentation/views/favorite_view.dart';
import 'package:mego_food/features/home/presentation/views/notification_view.dart';
import 'package:mego_food/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> listIcons1 = [
    'assets/icons/Home.svg',
    'assets/icons/Explore.svg',
    'assets/icons/Cart.svg',
    'assets/icons/Like.svg',
    'assets/icons/Notification.svg',
  ];
  final List<String> listIcons2 = [
    'assets/icons/Home tilted.svg',
    'assets/icons/Explore  tilted.svg',
    'assets/icons/Cart tilted.svg',
    'assets/icons/Like tilted.svg',
    'assets/icons/Notification-1.svg',
  ];
  final List<Widget> pages = const [
    HomeViewBody(),
    ExploreView(),
    CartView(),
    FavoriteView(),
    NotificationView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(index: currentIndex, children: pages),
        bottomNavigationBar: CustomBottomNav(
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          listIcons1: listIcons1,
          listIcons2: listIcons2,
        ),
      ),
    );
  }
}
