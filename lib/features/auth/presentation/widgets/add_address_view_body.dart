import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/validators/simple_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/auth/presentation/widgets/add_address_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/set_default_address.dart';

class AddAddressViewBody extends StatefulWidget {
  const AddAddressViewBody({super.key, this.initialData});
  final Map<String, dynamic>? initialData;

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final adressLabelController = TextEditingController();
  final deliveryInstrucController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postalController = TextEditingController();
  final countryController = TextEditingController();

  bool status = false;
  @override
  void initState() {
    super.initState();

    if (widget.initialData != null) {
      final data = widget.initialData!;
      adressLabelController.text = data['label'] ?? '';
      deliveryInstrucController.text = data['delivery-instruction'] ?? '';
      streetController.text = data['street'] ?? '';
      cityController.text = data['city'] ?? '';
      stateController.text = data['state'] ?? '';
      postalController.text = data['zipCode'] ?? '';
      countryController.text = data['country'] ?? '';
      status = data['default'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
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
              AppTextField(
                controller: adressLabelController,
                hintText: 'address label (e.g. home, work, other)',
                validator: (value) => simpleValidator(value),
              ),
              AppTextField(
                maxLines: 2,
                controller: deliveryInstrucController,
                hintText:
                    'delivery instructions (optional for\nspecific directions or requests)',
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
                  GoRouter.of(context).pop({
                    'label': adressLabelController.text,
                    'delivery-instruction': deliveryInstrucController.text,
                    'street': streetController.text,
                    'city': cityController.text,
                    'state': stateController.text,
                    'zipCode': postalController.text,
                    'country': countryController.text,
                    'default': status,
                  });
                },
                buttonType: streetController.text.isEmpty
                    ? AppButtonType.disabled
                    : AppButtonType.primary,
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
