import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/functions/sized_box_functions.dart';
import '../../core/routes/app_routes.dart';

import '../../core/functions/validation_functions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/field_header_widget.dart';
import '../widgets/success_dialog_widget.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? value;
  String? name;
  String? email;
  String? phone;
  late String date;
  final List<String> items = [
    'Price',
    'Product',
    'Customer Satisfaction',
    'Other'
  ];

  @override
  void initState() {
    name = 'Jane Steppingaside';
    email = 'jane@steppingaside.com';
    phone = '+01555788700';
    date = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("help_").tr(),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "help_subject",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.text2),
                ).tr(),
              ),
              8.hh,
              SizedBox(
                width: 350.w,
                child: DropdownButtonFormField<String>(
                  style: Theme.of(context).textTheme.displaySmall,
                  focusColor: Colors.red,

                  // dropdownColor: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                  decoration: const InputDecoration(border: InputBorder.none),
                  isExpanded: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hint: Text(
                    'fkf',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  value: items.first,
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? changeValue) {
                    value = changeValue;
                  },
                  onSaved: (String? changeValue) {
                    value = changeValue;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "please selecet type";
                    }
                    return null;
                  },
                ),
              ),
              20.hh,
              const FieldHeaderWidget(
                title: "name_surname",
                isRequired: true,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.name,
                initialValue: name,
                validator: actionValidation,
              ),
              20.hh,
              const FieldHeaderWidget(
                title: "e_mail",
                isRequired: true,
              ),
              CustomTextFormField(
                initialValue: email,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidation,
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
              ),
              20.hh,
              const FieldHeaderWidget(
                title: "details_",
                isRequired: true,
              ),
              const CustomTextFormField(
                hintText: "Please explain",
                label: '',
                keyboardType: TextInputType.number,
                validator: actionValidation,
                linesCount: 6,
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
                      successDialogWidget(
                        title: 'message_sent',
                        content: "thank_you_for_contacting_us",
                        buttonName: 'save_',
                        screen: Routes.navigationBarRoute,
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
