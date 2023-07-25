import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../core/functions/sized_box_functions.dart';
import '../../../../core/functions/validation_functions.dart';
import '../../../../core/network/wallet_request.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../user_feature/presentation/provider/user_provider.dart';

class VerificationScreenModel {
  final String email;
  final bool isNeedToSendMoney;
  final WalletRequest? transactionRequest;

  VerificationScreenModel({
    required this.email,
    required this.isNeedToSendMoney,
    this.transactionRequest,
  });
}

class VerificationScreen extends StatefulWidget {
  final VerificationScreenModel verificationScreenModel;

  const VerificationScreen({
    Key? key,
    required this.verificationScreenModel,
  }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  String currentText = "";

  @override
  void initState() {
    context
        .read<UserProvider>()
        .forgetPassword(email: widget.verificationScreenModel.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('verification_').tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.hh,
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Text(
                  'otp_verification',
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Text(
                  'enter_otp_code',
                  style: Theme.of(context).textTheme.bodyMedium,
                ).tr(),
              ),
              24.hh,
              Card(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: PinCodeTextField(
                                autovalidateMode: AutovalidateMode.disabled,
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 6,
                                // obscureText: true,
                                // obscuringCharacter: '*',
                                backgroundColor: Colors.transparent,
                                // obscuringWidget: const FlutterLogo(size: 24,),
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: otpValidation,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(10.r),
                                  fieldHeight: 45.h,
                                  fieldWidth: 45.w,
                                  activeColor: AppColors.primary,
                                  selectedColor: AppColors.border,
                                  inactiveColor: AppColors.border,
                                  disabledColor: AppColors.black,
                                  activeFillColor: Colors.transparent,
                                  selectedFillColor: Colors.transparent,
                                  inactiveFillColor: AppColors.black,
                                  errorBorderColor: Colors.transparent,
                                ),

                                cursorColor: AppColors.black,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: false,
                                // errorAnimationController: errorController,
                                controller: _textController,
                                keyboardType: TextInputType.number,

                                // onCompleted: (v) {
                                //   debugPrint("Completed");
                                //   debugPrint(_textController.text.toString());
                                // },
                                onTap: () {
                                  // print("Pressed");
                                },
                                onChanged: (value) {
                                  debugPrint(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  debugPrint("Allowing to paste $text");

                                  return true;
                                },
                              ),
                            )),
                        // Consumer<WalletProvider>(
                        //   child: const CustomLoadingWidget(),
                        //   builder: (context, walletProvider, child) {
                        //     return walletProvider.isLoading
                        //         ? child!
                        //         : CustomTextButtonWidget(
                        //             buttonName: 'verify_'.tr(),
                        //             backgroundColor: AppColors.primary,
                        //             width: 120.w,
                        //             onPressed: () async {
                        //               if (_formKey.currentState?.validate() ??
                        //                   false) {
                        //                 _formKey.currentState?.save();

                        //                 await context
                        //                     .read<UserProvider>()
                        //                     .verifyOtp(
                        //                       otpRequest: OtpRequest(
                        //                         otp: _textController.text,
                        //                         email: widget
                        //                             .verificationScreenModel
                        //                             .email,
                        //                       ),
                        //                       screenName: widget
                        //                               .verificationScreenModel
                        //                               .isNeedToSendMoney
                        //                           ? null
                        //                           : Routes
                        //                               .otpUpdatePasswordScreen,
                        //                     );
                        //                 if (widget.verificationScreenModel
                        //                     .isNeedToSendMoney) {
                        //                   await context
                        //                       .read<WalletProvider>()
                        //                       .createWallet(
                        //                           walletRequest: widget
                        //                               .verificationScreenModel
                        //                               .transactionRequest!);
                        //                   Navigator.of(context).pop();
                        //                   Navigator.of(navContext).pop();
                        //                 }
                        //               }
                        //             },
                        //           );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              16.hh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "didn't_receive_a_code?".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        WidgetSpan(
                          child: InkWell(
                            child: Text(
                              'resend_code',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.primary),
                            ).tr(),
                            // onTap: () async =>
                            //     await ProfileApi().sendVerification(
                            //   type: widget.type,
                            //   token:
                            //       context.read<AuthProvider>().user!.accessToken!,
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  "clear_".tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ).tr(),
                onPressed: () => _textController.clear(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
