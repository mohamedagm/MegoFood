import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/utils/validators/full_name_validator.dart';
import 'package:mego_food/core/utils/validators/egyptian_phone_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/auth/data/models/address_model.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/custom_bottom_sheet.dart';
import 'package:mego_food/features/auth/presentation/widgets/profile_image_picker.dart';
import 'package:intl/intl.dart';

class CreateProfileViewBody extends StatefulWidget {
  const CreateProfileViewBody({super.key});

  @override
  State<CreateProfileViewBody> createState() => _CreateProfileViewBodyState();
}

class _CreateProfileViewBodyState extends State<CreateProfileViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();
  AddressModel? addressModel;
  void _pickImage() {
    customModalBottomSheet(context, _picker, (file) {
      setState(() => _selectedImage = file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCreateProfileSuccess) {
          customSnackbar(
            context,
            'Profile created successfully',
            SnackbarType.success,
          );
          GoRouter.of(context).go(AppRoutes.home);
        } else if (state is AuthFailure) {
          final failure = state.failure;
          customSnackbar(context, failure.message, SnackbarType.error);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(),
                  Text(
                    'Create your new\nprofile',
                    style: context.exTextStyles.heading1,
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
                        var formattedDate = DateFormat(
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
                      final result = await GoRouter.of(
                        context,
                      ).push(AppRoutes.addAddress, extra: addressModel);

                      if (result != null && result is AddressModel) {
                        setState(() {
                          addressModel = result;
                          addressController.text = result.label ?? '';
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  IgnorePointer(
                    ignoring: state is AuthLoading,
                    child: AppElevatedButton(
                      onPressed: () {
                        context.read<AuthCubit>().createProfileC(
                          name: nameController.text,
                          phone: phoneController.text,
                          dateOfBirth: dateController.text,
                          address: addressModel!,
                          image: _selectedImage,
                        );
                      },
                      buttonType: addressController.text.isEmpty
                          ? AppButtonType.disabled
                          : AppButtonType.primary,
                      child: state is AuthLoading
                          ? Center(child: CircularProgressIndicator())
                          : Text('Continue'),
                    ),
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
