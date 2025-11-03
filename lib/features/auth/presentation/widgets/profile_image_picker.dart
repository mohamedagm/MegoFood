import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'camera_button.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? image;
  final VoidCallback onPick;

  const ProfileImagePicker({
    super.key,
    required this.image,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.exColors;

    return Center(
      child: InkWell(
        onTap: onPick,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: colors.grey500,
                shape: BoxShape.circle,
                image: image != null
                    ? DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: image == null
                  ? Center(
                      child: SvgPicture.asset(
                        'assets/icons/Profile.svg',
                        color: colors.baseWhite,
                        width: 72,
                        height: 72,
                      ),
                    )
                  : null,
            ),
            Positioned(right: -6, bottom: -6, child: CameraButton()),
          ],
        ),
      ),
    );
  }
}
