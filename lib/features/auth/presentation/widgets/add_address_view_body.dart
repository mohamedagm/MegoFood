import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/validators/simple_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/auth/data/models/address_model.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/add_address_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/set_default_address.dart';

class AddAddressViewBody extends StatefulWidget {
  const AddAddressViewBody({super.key, this.initialData});
  final AddressModel? initialData;

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final adressLabelController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postalController = TextEditingController();
  final countryController = TextEditingController();
  bool status = false;
  AddressModel? addressModel;
  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      final data = widget.initialData!;
      adressLabelController.text = data.label ?? '';
      streetController.text = data.street;
      cityController.text = data.city;
      stateController.text = data.state;
      postalController.text = data.postalCode;
      countryController.text = data.country;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAddAddress) {
          streetController.text = state.addressModel.street;
          cityController.text = state.addressModel.city;
          stateController.text = state.addressModel.state;
          postalController.text = state.addressModel.postalCode;
          countryController.text = state.addressModel.country;
        }
        if (state is AuthFailure) {
          log(state.failure.message);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
              behavior: SnackBarBehavior.floating,
              backgroundColor: context.exColors.baseBlack,
            ),
          );
        }
      },
      builder: (BuildContext context, AuthState state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddAddressHeader(),
                  SetDefaultAddress(
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                    status: status,
                  ),
                  Divider(color: context.exColors.grey200, thickness: 1),

                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: IgnorePointer(
                          ignoring: state is AuthLoading,
                          child: AppElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().getLocation();
                            },
                            child: state is AuthLoading
                                ? Center(child: CircularProgressIndicator())
                                : Text('Get Location'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppElevatedButton(
                          onPressed: () async {
                            final result = await GoRouter.of(
                              context,
                            ).push(AppRoutes.pickFromMap);

                            if (result != null && result is AddressModel) {
                              setState(() {
                                addressModel = result;
                                streetController.text = result.street;
                                cityController.text = result.city;
                                stateController.text = result.state;
                                postalController.text = result.postalCode;
                                countryController.text = result.country;
                              });
                            }
                          },
                          child: Text('Pick From Map'),
                        ),
                      ),
                    ],
                  ),

                  AppTextField(
                    onChanged: (value) => setState(() {}),
                    controller: adressLabelController,
                    hintText: 'address label (e.g. home, work, other)',
                    validator: (value) => simpleValidator(value),
                  ),
                  Divider(color: context.exColors.grey200, thickness: 1),
                  AppTextField(
                    onChanged: (value) => setState(() {}),
                    controller: streetController,
                    hintText: 'street address',
                    validator: (value) => simpleValidator(value),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: cityController,
                          hintText: 'city',
                          validator: (value) => simpleValidator(value),
                        ),
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: stateController,
                          hintText: 'state / province / region',
                          validator: (value) => simpleValidator(value),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: postalController,
                          hintText: 'ZIP / postal code',
                          validator: (value) => simpleValidator(value),
                        ),
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: countryController,
                          hintText: 'country',
                          validator: (value) => simpleValidator(value),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: context.exColors.grey200, thickness: 1),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  AppElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pop(
                        AddressModel(
                          label: adressLabelController.text,
                          street: streetController.text,
                          city: cityController.text,
                          state: stateController.text,
                          postalCode: postalController.text,
                          country: countryController.text,
                        ),
                      );
                    },
                    buttonType: adressLabelController.text.isEmpty
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
