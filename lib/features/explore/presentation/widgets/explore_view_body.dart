import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/explore/presentation/widgets/explore_categories.dart';
import 'package:mego_food/features/explore/presentation/widgets/explore_results.dart';
import 'package:mego_food/features/explore/presentation/widgets/explore_search_suggestions.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_button.dart';

enum ExploreMode { browse, searching, results }

class ExploreViewBody extends StatefulWidget {
  const ExploreViewBody({super.key});

  @override
  State<ExploreViewBody> createState() => _ExploreViewBodyState();
}

class _ExploreViewBodyState extends State<ExploreViewBody> {
  final TextEditingController controller = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  ExploreMode mode = ExploreMode.browse;

  @override
  void initState() {
    super.initState();

    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus &&
          controller.text.isEmpty &&
          mode != ExploreMode.results) {
        setState(() => mode = ExploreMode.browse);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: AppTextField(
                      onFieldSubmitted: (value) {
                        controller.text = value;
                        searchFocusNode.unfocus();
                        setState(() => mode = ExploreMode.results);
                      },
                      focusNode: searchFocusNode,
                      controller: controller,
                      hintText: 'search for food...',
                      onTap: () {
                        setState(() => mode = ExploreMode.searching);
                      },
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() => mode = ExploreMode.browse);
                        } else {
                          setState(() => mode = ExploreMode.searching);
                        }
                      },
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/Search.svg',
                        colorFilter: ColorFilter.mode(
                          context.exColors.grey400,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),

                if (mode == ExploreMode.results) ...[
                  const SizedBox(width: 8),
                  FilterButton(),
                ],
              ],
            ),
            const SizedBox(height: 12),

            if (mode == ExploreMode.searching)
              ExploreSearchSuggestions(
                onSelect: (value) {
                  controller.text = value;
                  searchFocusNode.unfocus();
                  setState(() => mode = ExploreMode.results);
                },
              ),

            if (mode == ExploreMode.browse)
              Expanded(
                child: ExploreCategories(
                  onTap: (value) {
                    controller.text = value;
                    setState(() => mode = ExploreMode.results);
                  },
                ),
              ),

            if (mode == ExploreMode.results)
              const Expanded(child: ExploreResults()),
          ],
        ),
      ),
    );
  }
}
