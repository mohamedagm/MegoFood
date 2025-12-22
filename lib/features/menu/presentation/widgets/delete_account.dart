import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/core/widgets/custom_header.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(
                    leading: AppBackButton(),
                    title: Text(
                      'Delete Account',
                      style: context.exTextStyles.large,
                    ),
                  ),
                  Text(
                    'You are going to\ndelete your account.',
                    style: context.exTextStyles.heading1,
                  ),
                  Text(
                    'We are very sorry to see you leaving.\nDeleting your account will permanently\ndelete all of the data plus any active subscriptions and this action can’t be\nundone!',
                    style: context.exTextStyles.medium400,
                  ),
                  Text(
                    'If you still want to delete your account, enter\n“CONFIRM” to proceed.',
                    style: context.exTextStyles.medium400,
                  ),
                  AppTextField(
                    controller: controller,
                    hintText: 'enter “CONFIRM”',
                    validator: (value) {
                      if (value != 'CONFIRM') {
                        return 'Please enter "CONFIRM" to proceed';
                      }
                      return null;
                    },
                    onChanged: (v) => setState(() {}),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.32),
                  AppElevatedButton(
                    buttonType: controller.text.isEmpty
                        ? AppButtonType.disabled
                        : AppButtonType.danger,
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;

                      final confirm = await showDeleteConfirmDialog(context);

                      if (confirm == true) {
                        // TODO: Call delete account API here
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    },

                    child: Text('Delete account'),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool?> showDeleteConfirmDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Are you sure?', style: context.exTextStyles.heading2),
              const SizedBox(height: 8),
              Text(
                'This action will permanently delete your account and cannot be undone.',
                style: context.exTextStyles.medium400,
              ),
              const SizedBox(height: 24),

              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: AppElevatedButton(
                      buttonType: AppButtonType.skip,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  Expanded(
                    child: AppElevatedButton(
                      buttonType: AppButtonType.danger,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
