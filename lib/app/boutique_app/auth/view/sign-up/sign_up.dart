import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_tab/route/agency_tab_route.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../../base/view/base_components/custom_button.dart';
import '../../../../../base/view/base_components/custom_checkbox.dart';
import '../../../../../base/view/base_components/custom_image_picker.dart';
import '../../../../../base/view/base_components/custom_text_form_filed.dart';
import '../../../../../base/view/base_components/image_placeholder.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  CustomImagePicker customImagePicker = CustomImagePicker();

  int currentIndex = 0;
  bool isPasswordSecure = true;
  bool isConfirmPassSecure = true;
  bool isCheckboxSelected = false;

  File? file;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();


  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPassFocusNode = FocusNode();


  @override
  void initState() {
    super.initState();

    customImagePicker.onFile = (value){
      setState(() {
        file = File(value[0]);
      });
    };
    customImagePicker.onLoading = (value){
      setState(() {});
    };

    customImagePicker.onError = (error){
      setState(() {

      });
    };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 26.sp),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.sp),
                          child: GestureDetector(
                            onTap: () {
                              customImagePicker.bottom(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(120.sp/2),
                              ),
                              width: 108.sp,
                              height: 108.sp,
                              child: ImagePlaceHolder(
                                isLoading: customImagePicker.isLoading,
                                child: file != null ?
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100.sp),
                                    child: Image.file(file!,fit: BoxFit.cover,)
                                ) : null,
                              ),
                  
                            ),
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 50.sp),
                  
                      CustomTextField(
                        focusNode: nameFocusNode,
                        // autofillHints: const [AutofillHints.email],
                        maxLength: 50,
                        controller: nameController,
                        hint: "Enter your name",
                        isOptional: true,
                        isEnable: true,
                        inputType: TextInputType.name,
                        name: "Name",
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          setState(() {
                            nameFocusNode.nextFocus();
                          });
                        },
                      ),

                      SizedBox(height: 10.sp,),
                  
                      CustomTextField(
                        autofillHints: const [AutofillHints.email],
                        maxLength: 50,
                        controller: emailController,
                        hint: "Enter your Email Address",
                        isOptional: true,
                        isEnable: true,
                        inputType: TextInputType.emailAddress,
                        name: "Email Address",
                        regex: StringValidation.emailValidation,
                        textInputAction: TextInputAction.next,
                        focusNode: emailFocusNode,
                        onEditingComplete: () {
                          setState(() {
                            emailFocusNode.nextFocus();
                          });
                        },
                      ),

                      SizedBox(height: 10.sp,),

                      CustomTextField(
                        // autofillHints: const [AutofillHints.email],
                        maxLength: 50,
                        controller: mobileController,
                        hint: "Enter your mobile Number",
                        isOptional: true,
                        isEnable: true,
                        inputType: TextInputType.phone,
                        name: "mobile Number",
                        regex: StringValidation.mobileValidation,
                        textInputAction: TextInputAction.next,
                        focusNode: mobileFocusNode,
                        onEditingComplete: () {
                          setState(() {
                            mobileFocusNode.nextFocus();
                          });
                        },
                      ),

                      SizedBox(height: 10.sp,),

                      CustomTextField(
                        maxLength: 50,
                        controller: passwordController,
                        hint: "Enter Password",
                        isOptional: true,
                        isEnable: true,
                        inputType: TextInputType.text,
                        name: "Password",
                        isSecure: isPasswordSecure,
                        textInputAction: TextInputAction.next,
                        focusNode: passwordFocusNode,
                        onEditingComplete: () {
                          setState(() {
                            passwordFocusNode.nextFocus();
                          });
                        },
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

                      SizedBox(height: 10.sp,),
                  
                      CustomTextField(
                        maxLength: 50,
                        controller: confirmPassController,
                        hint: "Enter Confirm Password",
                        isOptional: true,
                        isEnable: true,
                        inputType: TextInputType.text,
                        name: "Password",
                        isSecure: isConfirmPassSecure,
                        focusNode: confirmPassFocusNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          setState(() {
                            confirmPassFocusNode.unfocus();
                          });
                        },
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
                  
                      SizedBox(height: 20.sp),
                  
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                  
                          Padding(
                            padding: EdgeInsets.only(top: 0.sp),
                            child: CustomCheckBox(
                              value: isCheckboxSelected, onChanged: (value) {
                              setState(() {
                                isCheckboxSelected = value == true;
                              });
                            },
                              // borderColor: kBorderGradient1
                            ),
                          ),
                  
                          SizedBox(width: 12.sp),
                  
                          Expanded(
                            child: Text.rich(
                                TextSpan(text: "I agree to the ", children: [
                                  TextSpan(text: "Terms & conditions ",style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          //   return WebViewScreen(htmlContent: termsAndCondition,title: "Terms And Condition",);
                                          // },));
                                        }
                                  ),
                                  TextSpan(text: "as set out in our",style:CustomTextStyle.mainColorRegularFont18Style.copyWith(fontSize: 16.sp) ),
                  
                                  TextSpan(text: " Privacy Policy",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          //   return WebViewScreen(htmlContent: privacyPolicy,title: "Privacy policy",);
                                          // },));
                                        }
                                  )
                                ]), style: CustomTextStyle.mainColorRegularFont18Style.copyWith(fontSize: 16.sp) ),
                          ),
                        ],
                      ),
                  
                      SizedBox(height: 50.sp),
                  
                      CustomButton(
                        onTap: (){
                       AgencyTabRoute.goToAgeTabPage(context);
                        },
                        isLoading: false,
                        btnColor: kPrimaryColor,
                        btnText: "Sign Up",
                        textStyle: CustomTextStyle.whiteBoldFont18Style,
                        radius: 100.sp,
                        isBoxShadow: false,
                      ),
                  
                      SizedBox(height: 25.sp),
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already had an account",style: CustomTextStyle.mainColorRegularFont18Style.copyWith(fontSize: 16.sp)),
                  
                          SizedBox(width: 10.sp,),
                  
                          InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                                // FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Text("Sign In",style: CustomTextStyle.boldFont14kBlackStyle,))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
