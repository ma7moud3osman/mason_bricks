import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/sized_box_functions.dart';
import '../../../../core/utils/app_font.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../core/functions/validation_functions.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.paddingH,
          vertical: AppPadding.paddingV,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "sign_up",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.primary),
                  ).tr(),
                ],
              ),
              5.hh,
              Text(
                "enter_your_credentials_to_continue.",
                style: Theme.of(context).textTheme.labelSmall,
              ).tr(),
              40.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "first_name",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.text2),
                ).tr(),
              ),
              5.hh,
              CustomTextFormField(
                keyboardType: TextInputType.text,
                validator: titleValidation,
                onSave: (String? value) => firstName = value,
                initialValue: firstName,
              ),

              25.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "last_name",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.text2),
                ).tr(),
              ),
              5.hh,
              CustomTextFormField(
                keyboardType: TextInputType.text,
                validator: titleValidation,
                onSave: (String? value) => lastName = value,
                initialValue: lastName,
              ),
              25.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "phone_".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.text2),
                ).tr(),
              ),
              5.hh,

              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  validator: phoneValidation,
                  initialValue: phone,
                  onSave: (String? value) => phone = value,
                ),
              ),
              25.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "e_mail",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.text2),
                ).tr(),
              ),
              5.hh,

              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidation,
                  onSave: (String? value) => email = value,
                  initialValue: email,
                ),
              ),

              25.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "password_",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
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
                  obscureText: isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  validator: passwordValidation,
                  initialValue: password,
                  onSave: (String? value) => password = value,
                ),
              ),
              25.hh,
              Row(
                children: [
                  Text(
                    'by_continuing_you_agree_to_our ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ).tr(),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    child: Text(
                      'terms_of_service',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primary),
                    ).tr(),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.termsRoute),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    ' and ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ).tr(),
                  InkWell(
                    child: Text(
                      'privacy_policy.',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.primary),
                    ).tr(),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.privacyRoute),
                  ),
                ],
              ),

              25.hh,
              // Text.rich(
              //   TextSpan(
              //     children: [
              //       TextSpan(
              //         text: 'By continuing you agree to our ',
              //       ),
              //       TextSpan(
              //         text: 'Terms of Service',
              //         style: Theme.of(context)
              //             .textTheme
              //             .bodySmall!
              //             .copyWith(color: AppColors.primary),
              //       ),
              //       TextSpan(
              //         text: ' and ',
              //         style: Theme.of(context).textTheme.bodySmall,
              //       ),
              //       TextSpan(
              //         text: 'Privacy Policy.',
              //         style: Theme.of(context)
              //             .textTheme
              //             .bodySmall!
              //             .copyWith(color: AppColors.primary),
              //       ),
              //     ],
              //   ),
              // ),
              40.hh,
              Selector<AuthProvider, bool>(
                selector: (context, authProvider) {
                  return authProvider.isLoading;
                },
                child: CustomElevatedButton(
                  buttonSize: Size.fromHeight(50.h),
                  buttonLabel: "sign_up",
                  fontSize: 16.sp,
                  onPress: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState!.save();
                      context.read<AuthProvider>().signUp(
                            firstName: firstName!,
                            lastName: lastName!,
                            password: password!.trim(),
                            phone: phone!,
                            email: email!.trim(),
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
                    "already_have_an_account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ).tr(),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(Routes.loginScreenRoute),
                    child: Text(
                      "sign_in",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.primary),
                    ).tr(),
                  ),
                ],
              ),
              40.hh,
            ],
          ),
        ),
      ),
    );
  }
}
