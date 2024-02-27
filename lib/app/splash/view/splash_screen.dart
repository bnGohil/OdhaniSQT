import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/base/view/base_components/loading_view.dart';


import '../../../utils/utils.dart';
import '../../auth/route/auth_route/auth_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        AuthRoute.goToIntroPage(context);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 1.sp
            ),
          ),
          ImageUtil.logo.whiteAppLogo,

          SizedBox(height: 20.sp),

          Loading(color: kWhiteColor,size: 30.sp),

          Expanded(
            child: SizedBox(
                height: 1.sp
            ),
          ),
          
        ],
      ),
    );
  }
}
