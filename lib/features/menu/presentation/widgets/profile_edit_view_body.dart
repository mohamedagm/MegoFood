import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/utils/validators/egyptian_phone_validator.dart';
import 'package:mego_food/core/utils/validators/full_name_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/core/widgets/cancel_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/core/widgets/save_button.dart';
import 'package:mego_food/features/auth/presentation/manager/userProfileCubit/user_profile_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/custom_bottom_sheet.dart';
import 'package:mego_food/features/auth/presentation/widgets/profile_image_picker.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key});

  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  Map<String, dynamic>? res;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  String? _networkImageUrl;
  bool _profileLoaded = false;

  void _pickImage() {
    customModalBottomSheet(context, _picker, (file) {
      setState(() => _selectedImage = file);
    });
  }

  void _fillFromProfile(UserProfileLoaded state) {
    if (_profileLoaded) return;
    _profileLoaded = true;
    final profile = state.profile;
    nameController.text = profile.fullName;
    dateController.text = profile.dateOfBirth ?? '';
    _networkImageUrl = profile.photoUrl;
  }

  @override
  void initState() {
    super.initState();
    // Always refresh from the server when opening the edit screen.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<UserProfileCubit>().loadProfile();
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileFailure) {
          customSnackbar(context, state.message, SnackbarType.error);
        }
      },
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          _fillFromProfile(state);
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: 16,
                children: [
                  CustomHeader(
                    leading: CancelButton(),
                    title: Text(
                      'My Account',
                      style: context.exTextStyles.large,
                    ),
                    actions: [SaveButton()],
                  ),
                  ProfileImagePicker(
                    image: _selectedImage,
                    imageUrl: _networkImageUrl,
                    onPick: _pickImage,
                  ),
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
                          'yyyy-MM-dd',
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  AppElevatedButton(
                    onPressed: () {},
                    buttonType: nameController.text.isEmpty
                        ? AppButtonType.disabled
                        : AppButtonType.primary,
                    child: Text('Continue'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
