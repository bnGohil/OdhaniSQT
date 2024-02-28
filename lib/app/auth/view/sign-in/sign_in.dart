import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odhani_design_sqt/app/auth/route/auth_route/auth_route.dart';
import 'package:odhani_design_sqt/app/tab/route/tab_route.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../base/view/base_components/custom_button.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_text_form_filed.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  bool isPasswordSecure = true;
  bool _keyboardVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.loose,
          children: [
             _keyboardVisible ? SizedBox() : ImageUtil.graphicsImage.signInImage  ,

            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30.sp),
              child: Container(
                  width: double.infinity,
                  height: 105.sp,
                  padding: EdgeInsets.symmetric(horizontal: 63.sp),
                  child: ImageUtil.logo.whiteAppLogo
              ),
            ),
            
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sign In",
                        style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 26.sp),
                      ),

                      SizedBox(height: 30.sp),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 19.5.sp),
                        child: Column(
                          children: [
                            CustomTextField(
                              autofillHints: const [AutofillHints.email],
                              maxLength: 50,
                              controller: emailController,
                              hint: "Enter your Email Address",
                              isOptional: false,
                              isEnable: true,
                              inputType: TextInputType.emailAddress,
                              name: "Email Address",
                              regex: StringValidation.emailValidation,
                              textInputAction: TextInputAction.next,
                            ),

                            CustomTextField(
                              maxLength: 50,
                              controller: passwordController,
                              hint: "Enter Password",
                              isOptional: false,
                              isEnable: true,
                              inputType: TextInputType.text,
                              name: "Password",
                              isSecure: isPasswordSecure,
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

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  AuthRoute.goToForgotPage(context);
                                },
                                child: Text(
                                "Forgot Password?",
                                style: CustomTextStyle.mainColorRegularFont18Style.copyWith(fontSize: 16.sp),
                              ),
                              ),
                            ),

                            SizedBox(height: 15.sp),

                            CustomButton(
                              onTap: (){
                                TabRoute.goToTabPage(context);
                              },
                              isLoading: false,
                              btnColor: kPrimaryColor,
                              btnText: "Sign In",
                              textStyle: CustomTextStyle.whiteBoldFont18Style,
                              radius: 100.sp,
                              isBoxShadow: false,
                            ),

                            SizedBox(height: 40.sp),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 90.sp,
                                  height: 1.sp,
                                  margin: EdgeInsets.only(right: 15.sp),
                                  color: Colors.grey.withOpacity(0.5),
                                  // child: ImageUtil.imageClass.leftLineImage
                                ),

                                Text(
                                    "Or sign in with",
                                    style: CustomTextStyle.mainColorRegularFont18Style
                                ),

                                Container(
                                  width: 90.sp,
                                  height: 1.sp,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: EdgeInsets.only(left: 15.sp),
                                  // child: ImageUtil.imageClass.rightLineImage
                                ),
                              ],
                            ),

                            SizedBox(height: 20.sp),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(socialMedialList.length, (index) {
                                return Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 15.sp),
                                  child: InkWell(
                                      onTap: (){

                                      },
                                      child: SvgPicture.asset("${iconPath}/${socialMedialList[index]}.svg")),
                                );
                              }),
                            ),

                            SizedBox(height: 20.sp),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don’t have account?",style: CustomTextStyle.mainColorRegularFont18Style.copyWith(fontSize: 16.sp)),

                                SizedBox(width: 10.sp,),

                                InkWell(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                      // FocusManager.instance.primaryFocus?.unfocus();
                                    },
                                    child: Text("SIGN UP",style: CustomTextStyle.boldFont14kBlackStyle,))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

   forgotBottomView({Key? key}){
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.sp),
          child: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text("Forgot Password", style: CustomTextStyle.mainColorBoldFont18Style),

                // SizedBox(
                //   height: 170.sp,
                //   width: 160.sp,
                //   child: ImageUtil.imageClass.forgotImage,
                // ),

                SizedBox(height: 50.sp),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Text(
                    "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                    style: CustomTextStyle.blackRegularFont16Style,
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 30.sp),

                CustomTextField(
                  maxLength: 50,
                  // focusNode: emailNode,
                  controller: emailController,
                  hint: "Enter Email",
                  isOptional: false,
                  isEnable: true,
                  inputType: TextInputType.emailAddress,
                  name: "Email Address",
                  regex: StringValidation.emailValidation,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    // emailNode.unfocus();
                  },
                ),

                SizedBox(height: 30.sp),

                CustomButton(
                  onTap: (){
                    // TabRoute.goToTabPage(context);
                  },
                  isLoading: false,
                  btnColor: kPrimaryColor,
                  btnText: "Send",
                  textStyle: CustomTextStyle.whiteBoldFont18Style,
                  radius: 100.sp,
                  isBoxShadow: false,
                ),

                SizedBox(height: 15.sp),

              ],
            ),
          ),
        );
      },

    );
  }

}
