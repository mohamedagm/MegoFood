import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/home/presentation/widgets/home_categories.dart';
import 'package:mego_food/features/home/presentation/widgets/home_grid_products.dart';
import 'package:mego_food/features/home/presentation/widgets/home_header.dart';
import 'package:mego_food/features/home/presentation/widgets/home_offers.dart';
import 'package:mego_food/features/home/presentation/widgets/home_search_suggestions.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController controller = TextEditingController();
  int selectedIndex = 0;
  bool showSuggestions = false;
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus) {
        setState(() => showSuggestions = false);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomScrollView(
              slivers: [
                /// HEADER
                const SliverToBoxAdapter(child: HomeHeader()),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                /// SEARCH
                SliverToBoxAdapter(
                  child: AppTextField(
                    focusNode: searchFocusNode,
                    onTap: () {
                      setState(() => showSuggestions = true);
                    },
                    onChanged: (value) {
                      setState(() => showSuggestions = value.isNotEmpty);
                    },
                    controller: controller,
                    hintText: 'search...',
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/Search.svg',
                      colorFilter: ColorFilter.mode(
                        context.exColors.grey400,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                /// OFFERS
                const SliverToBoxAdapter(child: HomeOffers()),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                /// CATEGORIES
                const SliverToBoxAdapter(child: HomeCategories()),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                //products
                HomeSliverProducts(),
              ],
            ),
          ),
          if (showSuggestions) HomeSearchSuggestions(),
        ],
      ),
    );
  }
}
