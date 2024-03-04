import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_button.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../route/auth_route/auth_route.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _SignInSState();
}

class _SignInSState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kWhiteColor,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
                child: ImageUtil.graphicsImage.introBg
            ),

            Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30.sp),
              child: Container(
                width: double.infinity,
                height: 127.sp,
                padding: EdgeInsets.symmetric(horizontal: 63.sp),
                  child: ImageUtil.logo.appLogo
              ),
            ),

            SafeArea(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onTap: (){
                        AuthRoute.goToSignInPage(context);
                      },
                      isLoading: false,
                      btnColor: kWhiteColor,
                      btnText: "Sign In",
                      textStyle: CustomTextStyle.blackRegularFont16Style,
                      radius: 100.sp,
                      isBoxShadow: false,
                    ),

                    SizedBox(height: 20.sp),

                    CustomButton(
                      onTap: (){
                        AuthRoute.goToSignUpPage(context);
                      },
                      isLoading: false,
                      btnColor: kWhiteColor,
                      btnText: "Sign Up",
                      textStyle: CustomTextStyle.blackRegularFont16Style,
                      radius: 100.sp,
                      isBoxShadow: false,
                    ),
                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
