import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_cached_image.dart';
import 'package:mego_food/features/auth/presentation/manager/userProfileCubit/user_profile_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        final profile = state is UserProfileLoaded ? state.profile : null;
        final firstName = profile?.fullName.split(' ').first ?? '';
        final hasPhoto = isValidImageUrl(profile?.photoUrl);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi $firstName', style: context.exTextStyles.medium400),
                Text(
                  'What are you carving?',
                  style: context.exTextStyles.large400,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context).push(AppRoutes.menu),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: hasPhoto
                    ? CachedNetworkImageProvider(profile!.photoUrl!)
                    : null,
                child: hasPhoto ? null : Icon(Icons.person),
              ),
            ),
          ],
        );
      },
    );
  }
}
