import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odhani_design_sqt/provider.dart';
import 'package:provider/provider.dart';
import 'app/splash/view/splash_screen.dart';
import 'package:odhani_design_sqt/utils/utils.dart';


class OdhaniApp extends StatelessWidget {
  const OdhaniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          AppProviders.otpTimerProvider,
        ],
        child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Odhani',
            routes: Routes().routes,
            theme: appTheme(context),
            // initialRoute: LendingRoute.route,
            home:  SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        }
        ),
      ),
    );
  }

  ThemeData appTheme(BuildContext context){
    return ThemeData(
        // appBarTheme: AppBarTheme.of(context).copyWith(
        //     centerTitle: true,
        //     color: Colors.transparent,
        //     systemOverlayStyle: const SystemUiOverlayStyle(
        //       statusBarColor: Colors.transparent,
        //       statusBarIconBrightness: Brightness.dark,
        //     ),
        //     foregroundColor: kBlackColor,
        //     surfaceTintColor: Colors.transparent,
        //     toolbarHeight: kToolbarHeight,
        //     titleTextStyle: TextStyle(
        //         color: kTextSecondaryColor,
        //         fontSize: 20.sp,
        //         fontWeight: FontWeight.w700,
        //         fontFamily: "NunitoSans"
        //     ),
        //     shape:  UnderlineInputBorder(
        //       borderSide: BorderSide(color: kTextSecondaryColor.withOpacity(0.30)),
        //     )
        // ),
        primarySwatch: primarySwatchColor,
        useMaterial3: true,
        fontFamily: "Outfit"
    );
  }
}