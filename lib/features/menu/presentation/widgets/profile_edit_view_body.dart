import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/validators/egyptian_phone_validator.dart';
import 'package:mego_food/core/utils/validators/full_name_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/core/widgets/cancel_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/core/widgets/save_button.dart';
import 'package:mego_food/features/auth/presentation/widgets/custom_bottom_sheet.dart';
import 'package:mego_food/features/auth/presentation/widgets/profile_image_picker.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key});

  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBody();
}

class _ProfileEditViewBody extends State<ProfileEditViewBody> {
  Map<String, dynamic>? res;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  void _pickImage() {
    customModalBottomSheet(context, _picker, (file) {
      setState(() => _selectedImage = file);
    });
  }

  @override
  void initState() {
    nameController.text = 'Memo Flull';
    phoneController.text = '+201118519183';
    dateController.text = '12-12-2000';
    addressController.text = 'Home';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              CustomHeader(
                leading: CancelButton(),
                title: Text('My Account', style: context.exTextStyles.large),
                actions: [SaveButton()],
              ),

              ProfileImagePicker(image: _selectedImage, onPick: _pickImage),
              AppTextField(
                controller: nameController,
                hintText: 'full name',
                validator: (value) => fullNameValidator(value),
              ),
              AppTextField(
                onChanged: (value) => setState(() {
                  formKey.currentState?.validate();
                }),
                controller: phoneController,
                hintText: 'phone number',
                validator: (value) => egyptianPhoneValidator(value),
              ),

              InkWell(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2018),
                    initialDate: DateTime(2000),
                  );

                  if (pickedDate != null) {
                    final formattedDate = DateFormat(
                      'dd/MM/yyyy',
                    ).format(pickedDate);
                    setState(() {
                      dateController.text = formattedDate;
                    });
                  }
                },
                child: IgnorePointer(
                  child: AppTextField(
                    controller: dateController,
                    hintText: 'date of birth',
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  res =
                      await GoRouter.of(
                            context,
                          ).push(AppRoutes.addAddress, extra: res)
                          as Map<String, dynamic>?;

                  if (res != null) {
                    setState(() {
                      addressController.text = res!['label'];
                    });
                  }
                },
                child: IgnorePointer(
                  child: AppTextField(
                    onChanged: (value) => setState(() {}),
                    controller: addressController,
                    hintText: 'Address',
                    suffixIcon: SvgPicture.asset(AppAssets.arrowRight),
                  ),
                ),
              ),
              Spacer(flex: 5),
              AppElevatedButton(
                onPressed: () {},
                buttonType: addressController.text.isEmpty
                    ? AppButtonType.disabled
                    : AppButtonType.primary,
                child: Text('Continue'),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
