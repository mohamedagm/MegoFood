import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

enum SnackbarType { error, success }

void customSnackbar(BuildContext context, String message, SnackbarType type) {
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: type == SnackbarType.error
              ? [Color(0xFFE53935), Color(0xFFD32F2F)]
              : [Colors.green.shade600, Colors.green.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: type == SnackbarType.error
                ? Colors.redAccent.shade100
                : Colors.green.shade100,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Expanded(child: Text(message, style: context.exTextStyles.medium)),
        ],
      ),
    ),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
