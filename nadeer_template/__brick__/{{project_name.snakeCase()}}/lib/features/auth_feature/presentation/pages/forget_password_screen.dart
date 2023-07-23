import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/sized_box_functions.dart';
import 'verification_screen.dart';

import '../../../../../../../core/functions/validation_functions.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../../../core/widgets/custom_text_field.dart';
import '../../../../core/routes/app_routes.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String? email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('forget_password').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    "forget_password",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.primary),
                  ).tr(),
                ],
              ),
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
              25.hh,
              CustomElevatedButton(
                buttonSize: Size.fromHeight(50.h),
                buttonLabel: "done_",
                fontSize: 16.sp,
                onPress: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    Navigator.of(context).pushNamed(
                      Routes.verificationScreen,
                      arguments: VerificationScreenModel(
                        email: email!,
                        isNeedToSendMoney: false,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
