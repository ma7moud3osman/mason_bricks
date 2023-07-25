import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/functions/sized_box_functions.dart';
import '../core/functions/validation_functions.dart';
import '../core/utils/app_font.dart';
import '../core/widgets/custom_elevated_button.dart';
import '../core/widgets/custom_text_field.dart';
import '../core/widgets/field_header_widget.dart';
import 'user_feature/presentation/provider/user_provider.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  bool isObscure3 = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? currentPassword;
  String? newPassword;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("update_password").tr(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.paddingH),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              25.hh,
              const FieldHeaderWidget(
                title: "current_password",
                isRequired: true,
              ),
              CustomTextFormField(
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () => setState(
                    () => isObscure1 = !isObscure1,
                  ),
                  icon: isObscure1
                      ? Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey[300],
                        )
                      : Icon(Icons.visibility_off_outlined,
                          color: Colors.grey[300]),
                ),
                obscureText: isObscure1,
                keyboardType: TextInputType.visiblePassword,
                validator: passwordValidation,
                onSave: (String? value) {
                  currentPassword = value;
                },
              ),
              20.hh,
              const FieldHeaderWidget(
                title: "new_password",
                isRequired: true,
              ),
              CustomTextFormField(
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () => setState(
                    () => isObscure2 = !isObscure2,
                  ),
                  icon: isObscure2
                      ? Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey[300],
                        )
                      : Icon(Icons.visibility_off_outlined,
                          color: Colors.grey[300]),
                ),
                obscureText: isObscure2,
                keyboardType: TextInputType.visiblePassword,
                validator: passwordValidation,
                onChanged: (String? value) => newPassword = value,
                onSave: (String? value) => newPassword = value,
              ),
              20.hh,
              const FieldHeaderWidget(
                title: "new_password_confirmation",
                isRequired: true,
              ),
              CustomTextFormField(
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () => setState(
                    () => isObscure3 = !isObscure3,
                  ),
                  icon: isObscure3
                      ? Icon(
                          Icons.visibility_outlined,
                          color: Colors.grey[300],
                        )
                      : Icon(Icons.visibility_off_outlined,
                          color: Colors.grey[300]),
                ),
                obscureText: isObscure3,
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != newPassword) {
                    return 'Passwords do not match';
                  }
                  confirmPassword = value;
                  return null;
                },
                onSave: (String? value) => confirmPassword = value,
              ),
              30.hh,
              SizedBox(
                width: 350,
                child: CustomElevatedButton(
                  buttonSize: Size.fromHeight(50.h),
                  buttonLabel: "save_",
                  fontSize: 16.sp,
                  onPress: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();

                      await context
                          .read<UserProvider>()
                          .changePassword(currentPassword!, newPassword!);

                      // successDialogWidget(
                      //   context: context,
                      //   title: 'Details Updated',
                      //   content: "Your details successfully saved.",
                      //   buttonName: 'Go to My Account',
                      //   screen: '',
                      // );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
