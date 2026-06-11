import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/helper/debouncer.dart';
import 'package:mego_food/core/widgets/app_shimmer.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/search/presentation/cubit/search_cubit.dart';
import 'package:mego_food/features/search/presentation/widgets/search_result_item.dart';
import 'package:mego_food/features/search/presentation/widgets/search_result_shimmer_item.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final Debouncer debouncer = Debouncer(milliseconds: 600);
  String lastQuery = '';
  void setupSearchListener() {
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final currentQuery = searchController.text;

    if (currentQuery == lastQuery) return;

    lastQuery = currentQuery;

    debouncer.run(() async {
      await context.read<SearchCubit>().searchByKeyword(currentQuery);
    });
  }

  @override
  void initState() {
    super.initState();
    setupSearchListener();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 250), () {
        if (!mounted) return;
        searchFocusNode.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    debouncer.dispose();
    searchFocusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: 20,
          children: [
            Hero(
              tag: 'search',
              child: Material(
                child: AppTextField(
                  controller: searchController,
                  focusNode: searchFocusNode,
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
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  final count = state.results.length;
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Search results for "${searchController.text}"',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.exTextStyles.large700.copyWith(
                            color: context.exColors.typography500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: context.exColors.grey100,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '$count items',
                          style: context.exTextStyles.small600.copyWith(
                            color: context.exColors.typography400,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is SearchLoading) {
                  return Row(
                    children: [
                      Expanded(
                        child: ShimmerBox(
                          height: 20,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 14),
                      ShimmerBox(
                        height: 30,
                        width: 72,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ],
                  );
                } else if (state is SearchFailure) {
                  if (searchController.text.isNotEmpty) {
                    return Text(
                      state.message,
                      style: context.exTextStyles.medium400.copyWith(
                        color: context.exColors.red,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  var searchResults = state.results;
                  if (searchResults.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          'No meals found',
                          style: context.exTextStyles.medium400,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: searchResults.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = searchResults[index];
                        return SearchResultItem(
                          item: item,
                          onTap: () => GoRouter.of(context).push(
                            AppRoutes.productDetails,
                            extra: item.toProductModel(),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is SearchLoading) {
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) =>
                          const SearchResultShimmerItem(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
