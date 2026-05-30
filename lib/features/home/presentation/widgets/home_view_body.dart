import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/home/presentation/cubit/home_cubit.dart';
import 'package:mego_food/features/home/presentation/cubit/home_state.dart';
import 'package:mego_food/features/home/presentation/widgets/home_section_header.dart';
import 'package:mego_food/features/home/presentation/widgets/home_top_rated.dart';
import 'package:mego_food/features/home/presentation/widgets/home_categories.dart';
import 'package:mego_food/features/home/presentation/widgets/home_header.dart';
import 'package:mego_food/features/home/presentation/widgets/home_offers.dart';
import 'package:mego_food/features/home/presentation/widgets/home_top_stores.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController controller = TextEditingController();

  Future<void> _refreshHome() async {
    final cubit = context.read<HomeCubit>();
    await cubit.getBaseCategories();
    await cubit.getTopRatedProducts();
    await cubit.getTopStores();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: RefreshIndicator(
          color: context.exColors.primary600,
          onRefresh: _refreshHome,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              /// HEADER
              const SliverToBoxAdapter(child: HomeHeader()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              /// SEARCH
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).push(AppRoutes.search),
                  child: Hero(
                    tag: 'search',
                    child: Material(
                      child: AppTextField(
                        enabled: false,
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
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              /// CATEGORIES
              const SliverToBoxAdapter(child: HomeCategories()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              /// OFFERS
              const SliverToBoxAdapter(child: HomeOffers()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // TOP Rated
              SliverToBoxAdapter(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final canSeeAll =
                        state.topRatedProductsStatus == RequestStatus.success &&
                        state.topRatedProducts.isNotEmpty;

                    return HomeSectionHeader(
                      title: 'Top Rated',
                      onSeeAll: canSeeAll
                          ? () => context.push(
                              AppRoutes.topRatedProducts,
                              extra: state.topRatedProducts,
                            )
                          : null,
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: HomeTopRated()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              SliverToBoxAdapter(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final canSeeAll =
                        state.topRatedRestaurantsStatus ==
                            RequestStatus.success &&
                        state.topRatedRestaurants.isNotEmpty;

                    return HomeSectionHeader(
                      title: 'Top Stores',
                      onSeeAll: canSeeAll
                          ? () => context.push(
                              AppRoutes.topStores,
                              extra: state.topRatedRestaurants,
                            )
                          : null,
                    );
                  },
                ),
              ),

              HomeTopStores(),
            ],
          ),
        ),
      ),
    );
  }
}
