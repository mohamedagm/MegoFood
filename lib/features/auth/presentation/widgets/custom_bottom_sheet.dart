import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'image_picker_options.dart';

void customModalBottomSheet(
  BuildContext context,
  ImagePicker picker,
  Function(File) onImagePicked,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImagePickerOptions(picker: picker, onImagePicked: onImagePicked),
          const SizedBox(height: 10),
          AppElevatedButton(
            buttonType: AppButtonType.primary,
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: context.exTextStyles.medium700),
          ),
        ],
      ),
    ),
  );
}
