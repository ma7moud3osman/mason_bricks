import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/functions/sized_box_functions.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_font.dart';
import 'package:provider/provider.dart';

import '../core/functions/validation_functions.dart';
import '../core/widgets/custom_date_widget.dart';
import '../core/widgets/custom_elevated_button.dart';
import '../core/widgets/custom_text_field.dart';
import '../core/widgets/field_header_widget.dart';
import 'user_feature/presentation/provider/user_provider.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? date;

  @override
  void initState() {
    final user = context.read<UserProvider>().currentUser;

    // final  user=context.read<UserProvider>().getMyProfile(isShowLoading: false);

    firstName = user?.firstName;
    lastName = user?.lastName;
    email = user?.email;
    phone = user?.phone;
    date = user?.birthDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my_details").tr(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.paddingH),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.hh,
                const FieldHeaderWidget(
                  title: "first_name",
                  isRequired: true,
                ),
                CustomTextFormField(
                  initialValue: firstName,
                  keyboardType: TextInputType.name,
                  validator: actionValidation,
                  onSave: (String? value) => firstName = value,
                ),
                20.hh,
                const FieldHeaderWidget(
                  title: "last_name",
                  isRequired: true,
                ),
                CustomTextFormField(
                  initialValue: lastName,
                  keyboardType: TextInputType.name,
                  validator: actionValidation,
                  onSave: (String? value) => lastName = value,
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
                8.hh,
                CustomTextFormField(
                  initialValue: email,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidation,
                  onSave: (String? value) => email = value,
                ),
                20.hh,
                const FieldHeaderWidget(
                  title: "phone_",
                  isRequired: true,
                ),
                CustomTextFormField(
                  initialValue: phone,
                  keyboardType: TextInputType.number,
                  validator: phoneValidation,
                  onSave: (String? value) => phone = value,
                ),
                20.hh,
                const FieldHeaderWidget(
                  title: "birth_date",
                  isRequired: true,
                ),
                CustomDateWidget(
                  title: 'birth_date',
                  date: date,
                  onTap: (value, isNeedToPop) {
                    date = value.toString();
                    if (isNeedToPop) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                30.hh,
                SizedBox(
                  width: 350,
                  child: CustomElevatedButton(
                    buttonSize: Size.fromHeight(50.h),
                    buttonLabel: "save_",
                    fontSize: 16.sp,
                    onPress: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        context.read<UserProvider>().updateCurrentUser(
                              firstName: firstName,
                              lastName: lastName,
                              profileImageUri:
                                  "https://static.vecteezy.com/system/resources/previews/021/548/095/original/default-profile-picture-avatar-user-avatar-icon-person-icon-head-icon-profile-picture-icons-default-anonymous-user-male-and-female-businessman-photo-placeholder-social-network-avatar-portrait-free-vector.jpg",
                              email: email,
                              phone: phone,
                              birthDate: date,
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
