import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/sized_box_functions.dart';
import 'package:provider/provider.dart';

import '../../../../core/functions/validation_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../user_feature/presentation/provider/user_provider.dart';

class OtpUpdatePasswordScreen extends StatefulWidget {
  const OtpUpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<OtpUpdatePasswordScreen> createState() =>
      _OtpUpdatePasswordScreenState();
}

class _OtpUpdatePasswordScreenState extends State<OtpUpdatePasswordScreen> {
  bool isObscure2 = true;
  bool isObscure3 = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? newPassword;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("update_password").tr(),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              25.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "new_password",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.text2),
                ).tr(),
              ),
              5.hh,
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
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
              ),
              25.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "new_password_confirmation",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.text2),
                ).tr(),
              ),
              5.hh,
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
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
                      return 'please_enter_your_confirm_password'.tr();
                    }
                    if (value != newPassword) {
                      return 'password_does_not_match'.tr();
                    }
                    confirmPassword = value;
                    print(confirmPassword);
                    return null;
                  },
                  onSave: (String? value) => confirmPassword = value,
                ),
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

                      await context.read<UserProvider>().updatePassword(
                            password: newPassword!,
                          );
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
