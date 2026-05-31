import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:mego_food/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:mego_food/features/favorite/widgets/empty_favorite.dart';
import 'package:mego_food/features/favorite/widgets/favorite_item.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 24,
            children: [
              CustomHeader(
                title: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Like.svg',
                      height: 28,
                      width: 28,
                    ),
                    Text('Favorite', style: context.exTextStyles.large),
                  ],
                ),
              ),
              BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  return switch (state) {
                    FavoriteInitial() || FavoriteLoading() => const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    FavoriteLoaded(:final items) =>
                      items.isEmpty
                          ? const Expanded(child: EmptyFavorite())
                          : Expanded(
                              child: ListView.separated(
                                itemCount: items.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  return FavoriteItem(
                                    item: item,
                                    onTap: () {
                                      GoRouter.of(context).push(
                                        AppRoutes.productDetails,
                                        extra: item.toProduct(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                    FavoriteFailure(:final message) => Expanded(
                      child: Center(child: Text(message)),
                    ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
