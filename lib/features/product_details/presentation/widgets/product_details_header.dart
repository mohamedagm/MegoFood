import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/features/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:mego_food/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key, required this.productModel});

  final ProductModel productModel;

  Future<void> _toggleFavorite(BuildContext context) async {
    final result = await context.read<FavoriteCubit>().toggleProduct(
      productModel,
    );
    if (!context.mounted) return;

    switch (result) {
      case FavoriteToggleResult.added:
        customSnackbar(context, 'Added to favorites', SnackbarType.success);
      case FavoriteToggleResult.removed:
        customSnackbar(context, 'Removed from favorites', SnackbarType.success);
      case FavoriteToggleResult.failure:
        customSnackbar(
          context,
          'Failed to update favorite',
          SnackbarType.error,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBackButton(),
        Row(
          spacing: 20,
          children: [
            SvgPicture.asset('assets/icons/Share.svg'),
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final isFavorite = state is FavoriteLoaded
                    ? state.isFavorite(productModel.id)
                    : false;

                return InkWell(
                  onTap: () => _toggleFavorite(context),
                  customBorder: const CircleBorder(),
                  child: SvgPicture.asset(
                    isFavorite
                        ? 'assets/icons/Like filled.svg'
                        : 'assets/icons/Like.svg',
                    colorFilter: ColorFilter.mode(
                      isFavorite
                          ? context.exColors.red
                          : context.exColors.typography500,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
