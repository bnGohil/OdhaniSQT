import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/common_utils/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../../base/view/base_components/custom_button.dart';
import '../../../../../base/view/base_components/custom_text_form_filed.dart';
import '../../../../../utils/utils.dart';
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
    return Scaffold(
      backgroundColor: kWhiteColor,
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        height: 100.sp,
        title: "Forgot Password",
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(

              children: [

                SizedBox(height: 30.sp),

                Text(
                  "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                  style: CustomTextStyle.blackRegularFont16Style,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20.sp),

                CustomTextField(
                  name: "number",
                  maxLength: 10,
                  inputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  regex: StringValidation.mobileValidation,
                  isOptional: true,
                  hint: "Enter Mobile number",
                  onChanged: (value) {

                  },
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
                          ).then((value) {

                            context.read<OtpTimer>().stopTimer();

                          });
                        },
                        isLoading: false,
                        btnColor: kPrimaryColor,
                        btnText: "Send",
                        textStyle: CustomTextStyle.whiteBoldFont18Style,
                        radius: 100.sp,
                        isBoxShadow: false,
                      ),
                      SizedBox(height: 10.sp,),

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
