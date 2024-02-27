import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/auth/view/sign-in/sign_in.dart';
import 'package:odhani_design_sqt/app/auth/view/sign-up/sign_up.dart';
import '../../view/intro/intro_screen.dart';

class AuthRoute{
  static String introRoute = "/intro";
  static String signInRoute = "/signIn";
  static String signUpRoute = "/signUp";
  static String radioSelectionRoute = "/radioSelection";
  static String multiSelectTagRoute = "/multiSelect";
  static String forgotRoute = "/forgot";
  static String changePasswordRoute = "/change_password";

  static Widget get introChild => const IntroScreen();
  static Widget get signInChild => const SignInScreen();
  static Widget get signUpChild => const SignUpScreen();
  // static Widget get registerChild => const RegisterScreen();
  // static Widget get radioBtnSelectionChild =>  RadioBtnSelectionView();
  // static Widget get multiSelectTagChild =>  MultiSelectChip();
  // static Widget get forgotChild => const ForgotPassword();
  // static Widget get changePasswordChild => const ChangePasswordScreen();

  static goToIntroPage(BuildContext context) {
    Navigator.of(context).pushNamed(introRoute);
  }

  static goToSignInPage(BuildContext context) {
    Navigator.of(context).pushNamed(signInRoute);
  }

  static goToSignUpPage(BuildContext context) {
    Navigator.of(context).pushNamed(signUpRoute);
  }
  //
  // static goToRadioBtnSelectionPage(BuildContext context, {RadioSelection? radioSelection}) {
  //   Navigator.of(context).pushNamed(radioSelectionRoute,arguments: radioSelection);
  // }
  //
  // static goToMultiSelectTagPage(BuildContext context,
  //     {RegisterReqModel? registerReqModel}) {
  //   Navigator.of(context).pushNamed(multiSelectTagRoute, arguments: registerReqModel);
  // }
  //
  // static goToForgotPage(BuildContext context) {
  //   Navigator.of(context).pushNamed(forgotRoute);
  // }
  //
  // static goToChangePassword(BuildContext context,[String? any]) {
  //   Navigator.of(context).pushNamed(changePasswordRoute,arguments: any);
  // }

}