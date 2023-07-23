import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/functions/sized_box_functions.dart';
import '../../../../core/functions/validation_functions.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_font.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  String? email;
  String? password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.paddingH),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              120.hh,
              Row(
                children: [
                  Text(
                    "sign_in",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.primary),
                  ).tr(),
                ],
              ),
              8.hh,
              Text(
                "enter_your_e_mail_and_password.",
                style: Theme.of(context).textTheme.labelSmall,
              ).tr(),
              40.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "e_mail",
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),
              ),
              5.hh,
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidation,
                  initialValue: email,
                  onSave: (val) {
                    email = val;
                  },
                ),
              ),
              40.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "password_",
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),
              ),
              5.hh,
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
                  obscureText: isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () => setState(
                      () => isObscure = !isObscure,
                    ),
                    icon: isObscure
                        ? Icon(
                            Icons.visibility_outlined,
                            color: Colors.grey[300],
                          )
                        : Icon(Icons.visibility_off_outlined,
                            color: Colors.grey[300]),
                  ),
                  validator: passwordValidation,
                  initialValue: password,
                  onSave: (val) {
                    password = val;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                      Routes.forgetPasswordScreen,
                    ),
                    child: Text(
                      "forgot_password?",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                    ).tr(),
                  ),
                ],
              ),
              25.hh,
              Selector<AuthProvider, bool>(
                selector: (context, authProvider) {
                  return authProvider.isLoading;
                },
                child: CustomElevatedButton(
                  buttonSize: Size.fromHeight(50.h),
                  buttonLabel: "sign_in",
                  fontSize: 16.sp,
                  onPress: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      context.read<AuthProvider>().emailLogin(
                            email!.trim(),
                            password!.trim(),
                          );
                    }
                  },
                ),
                builder: (context, isLoading, child) {
                  return isLoading ? const CustomLoadingWidget() : child!;
                },
              ),
              15.hh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't_have_an_account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ).tr(),
                  TextButton(
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      Routes.signUpScreenRoute,
                    ),
                    child: Text(
                      "sign_up",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.primary),
                    ).tr(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
