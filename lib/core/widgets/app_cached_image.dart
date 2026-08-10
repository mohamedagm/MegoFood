import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mego_food/core/widgets/app_shimmer.dart';

bool isValidImageUrl(String? imageUrl) {
  if (imageUrl == null) return false;

  final trimmedUrl = imageUrl.trim();
  if (trimmedUrl.isEmpty) return false;

  final uri = Uri.tryParse(trimmedUrl);
  return uri != null && uri.hasScheme && uri.hasAuthority;
}

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.fallbackAsset,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });

  final String? imageUrl;
  final double height;
  final double width;
  final String fallbackAsset;
  final BoxFit fit;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim() ?? '';

    if (!isValidImageUrl(url)) {
      return Image.asset(fallbackAsset, height: height, width: width, fit: fit);
    }

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) =>
          ShimmerBox(height: height, width: width, borderRadius: borderRadius),
      errorWidget: (context, url, error) {
        log('Image error: $error');
        return Image.asset(
          fallbackAsset,
          height: height,
          width: width,
          fit: fit,
        );
      },
    );
  }
}
