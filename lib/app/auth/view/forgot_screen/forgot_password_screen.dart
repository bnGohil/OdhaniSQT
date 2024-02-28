import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../base/view/base_components/custom_button.dart';
import '../../../../base/view/base_components/custom_text_form_filed.dart';
import '../../../../utils/utils.dart';
import '../otp/otp_bottom_sheet.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();

  bool hide = false;


  @override
  Widget build(BuildContext context) {
    // final otpTimer = context.read<OtpTimer>();
    // final authProvider = context.watch<AuthProvider>();
    // final forgotLoader = authProvider.forgotOtpResponse.state == Status.LOADING;

    return Scaffold(
      backgroundColor: kWhiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
        ),
        centerTitle: true,
        title: Text("Forgot Password"),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(

              children: [

                SizedBox(height: 30.sp),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Text(
                    "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                    style: CustomTextStyle.blackRegularFont16Style,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 20.sp),

                CustomTextField(
                  name: "number",
                  maxLength: 10,
                  inputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  regex: StringValidation.mobileValidation,
                  isOptional: false,
                  hint: "Enter number",
                ),


                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: ()async{
                          // TabRoute.goToTabPage(context);

                          final value = await showModalBottomSheet(
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            elevation: 0,
                            context: context,
                            builder: (context) {
                              // final authProvider = context.watch<AuthProvider>();
                              // final otp = authProvider.sendOtpResponse.data?.data?.otp;
                              return  OtpBottomSheet(
                                // emailId: phoneController.text,
                                // otp: otp,
                                isRegister: true,
                              );
                            },
                          );
                        },
                        isLoading: false,
                        btnColor: kPrimaryColor,
                        btnText: "Send",
                        textStyle: CustomTextStyle.whiteBoldFont18Style,
                        radius: 100.sp,
                        isBoxShadow: false,
                      ),

                    ],
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
