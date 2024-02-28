import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/auth/route/auth_route/auth_route.dart';
import '../../../../utils/utils.dart';
import '../../../../base/view/base_components/custom_button.dart';
import '../../../../base/view/base_components/custom_text_form_filed.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool isPasswordSecure = true;
  bool isConfirmPassSecure = true;
  bool isPassword = true,isConfirmPassword = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        title: Text("Change Password"),
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
                    "Your new password must be different from that of previously used passwords.",
                    style: CustomTextStyle.blackRegularFont16Style,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 20.sp),

                CustomTextField(
                  maxLength: 50,
                  controller: passwordController,
                  hint: "Enter Password",
                  isOptional: false,
                  isEnable: true,
                  inputType: TextInputType.text,
                  name: "Password",
                  isSecure: isPasswordSecure,
                  textInputAction: TextInputAction.next,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isPasswordSecure = !isPasswordSecure;
                      });
                    },
                    child: SizedBox(
                      width: 44.sp,
                      child: Center(child: SizedBox(width: 20.sp, height:20.sp, child: isPasswordSecure ? ImageUtil.iconImageClass.eyeCloseIcon : ImageUtil.iconImageClass.eyeOpenIcon)),
                    ),
                  ),
                ),

                CustomTextField(
                  maxLength: 50,
                  controller: confirmPassController,
                  hint: "Enter Confirm Password",
                  isOptional: false,
                  isEnable: true,
                  inputType: TextInputType.text,
                  name: "Password",
                  isSecure: isConfirmPassSecure,
                  textInputAction: TextInputAction.done,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isConfirmPassSecure = !isConfirmPassSecure;
                      });
                    },
                    child: SizedBox(
                      width: 44.sp,
                      child: Center(child: SizedBox(width: 20.sp, height:20.sp, child: isConfirmPassSecure ? ImageUtil.iconImageClass.eyeCloseIcon : ImageUtil.iconImageClass.eyeOpenIcon)),
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onTap: (){},
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
