import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ImagePickerOptions extends StatelessWidget {
  final ImagePicker picker;
  final Function(File) onImagePicked;

  const ImagePickerOptions({
    super.key,
    required this.picker,
    required this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.exColors.grey200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          _buildOption(
            context,
            icon: Icons.photo_camera_outlined,
            label: 'Take Photo',
            source: ImageSource.camera,
          ),
          Divider(color: context.exColors.grey400),
          _buildOption(
            context,
            icon: Icons.photo_library_outlined,
            label: 'Photo Gallery',
            source: ImageSource.gallery,
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required ImageSource source,
  }) {
    return ListTile(
      leading: Icon(icon, color: context.exColors.primary600, size: 30),
      title: Text(
        label,
        style: TextStyle(color: context.exColors.primary600, fontSize: 20),
      ),
      onTap: () async {
        if (source == ImageSource.camera) {
          Navigator.pop(context);
        }
        final XFile? pickedFile = await picker.pickImage(source: source);
        if (pickedFile != null) {
          onImagePicked(File(pickedFile.path));
        }
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
    );
  }
}
