
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/boutique_app/auth/view/sign-in/sign_in.dart';
import 'package:odhani_design_sqt/app/boutique_app/tab/view/tab_page.dart';
import 'package:provider/provider.dart';
import '../../../../base/base.dart';
import '../../splash/view/splash_screen.dart';
import '../view_model/lending_provider.dart';


class LendingPage extends StatefulWidget {
  const LendingPage({Key? key}) : super(key: key);

  @override
  State<LendingPage> createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> {

  bool lendingProvider = false;
  bool underMaintenance = false;

  UserPrefs userPrefs = UserPrefs();


  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
    //
    //
    //   final userProvider = context.read<UserProvider>();
    //   final lendingProvider = context.read<LendingProvider>();
    //   await userProvider.appSetting();
    //
    //   final data =  userProvider.appSettingResponse.data?.data;
    //   final isUnderMaintenance = data?.isUndermaintenance ?? 0;
    //
    //   if(isUnderMaintenance == 0){
    //     underMaintenance = false;
    //     setState(() {
    //
    //     });
    //   }else{
    //     underMaintenance = true;
    //     setState(() {
    //
    //     });
    //   }
    //
    //   String? minVersion;
    //   String? maxVersion;
    //
    //   if(Platform.isAndroid) {
    //     minVersion = data?.androidMinimumVersion;
    //     maxVersion = data?.androidMaximumVersion;
    //   } else {
    //     minVersion = data?.iosMinimumVersion;
    //     maxVersion = data?.iosMaximumVersion;
    //   }
    //
    //   await lendingProvider.manageAppSettings(isUnderMaintenance: underMaintenance, majorVersion: maxVersion, minorVersion: minVersion);
    //
    //   if(!lendingProvider.isMajorUpdate) {
    //
    //     if(lendingProvider.isMinorUpdate) {
    //       CustomShowModalBottomSheetPopup(context,
    //           title: "Update",
    //           message: "New Update Available.",
    //           primaryBtnTxt: "Update",
    //           primaryAction: () {
    //             // launchUrl(Uri.parse(ServerConfig.storeUrl),mode: LaunchMode.externalApplication);
    //           },
    //           secondaryBtnTxt: "Cancel");
    //     }
    //
    //   }
    //
    //
    // });


  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toaster.showMessage(context,  msg: "Press again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }


  @override
  Widget build(BuildContext context) {
    final lendingProvider = context.watch<LendingProvider>();

    // if(lendingProvider.isUnderMaintenance) {
    //   return  const Scaffold(
    //     body: NoDataFoundComponent(
    //       message: "App is under maintenance.",
    //       // onRetry: ()async{
    //       //   final userProvider = context.read<UserProvider>();
    //       //
    //       //   final lendingProvider = context.read<LendingProvider>();
    //       //
    //       //   await userProvider.appSetting();
    //       //
    //       //   final data =  userProvider.appSettingResponse.data?.data;
    //       //
    //       //   print("${userProvider.appSettingResponse.data?.data?.isUndermaintenance} === check this isUndermaintenance value");
    //       //
    //       //   if(data?.isUndermaintenance == 0) {
    //       //
    //       //     // await userProvider.getUserDetails();
    //       //     // Navigator.popUntil(context, (route) => route.isFirst)
    //       //
    //       //     String? minVersion;
    //       //     String? maxVersion;
    //       //
    //       //     if(Platform.isAndroid) {
    //       //       minVersion = data?.androidMinimumVersion;
    //       //       maxVersion = data?.androidMaximumVersion;
    //       //     } else {
    //       //       minVersion = data?.iosMinimumVersion;
    //       //       maxVersion = data?.iosMaximumVersion;
    //       //     }
    //       //
    //       //     await lendingProvider.manageAppSettings(isUnderMaintenance: false, majorVersion: maxVersion, minorVersion: minVersion);
    //       //
    //       //
    //       //   }
    //       // },
    //     ),
    //   );
    // }

    // if(lendingProvider.isMajorUpdate) {
    //   return Scaffold(
    //       body: Center(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text("New Update Available.", style: TextStyle(
    //                 fontWeight: FontWeight.w600,
    //                 fontSize: 17.sp
    //             ),),
    //             SizedBox(
    //               height: 15.sp,
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 // launchUrl(Uri.parse(ServerConfig.storeUrl),mode: LaunchMode.externalApplication);
    //               },
    //               child: Container(
    //                   padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(5),
    //                       border: Border.all(color: kPrimaryColor)
    //                   ),
    //                   child: Text("Update",style: TextStyle(
    //                       color: kPrimaryColor,
    //                       fontSize: 14.sp,
    //                       fontWeight: FontWeight.w500
    //                   ),)),
    //             ),
    //           ],
    //         ),
    //       )
    //   );
    // }


    if(lendingProvider.isLogin == false) {

      return const SignInScreen();

    }else if(lendingProvider.isLogin == true) {

      // return FirebaseMessagingHandler(onNotificationClick: (data) async{
      //   final homeListOrderProvider = context.read<HomeListOrderProvider>();
      //
      //   final startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      //
      //   if(data["screen_type"] == "order") {
      //     Navigator.of(context).popUntil((route) => route.isFirst);
      //     context.read<MainDashboardProvider>().tabChangeIndex(index: 0);
      //     await homeListOrderProvider.orderList(isFirst: true,
      //         orderListReqModel: OrderListReqModel(
      //           limit: "10",
      //           page: "1",
      //           startDate: DateTime.parse(startDate),
      //         ));
      //   }
      // }

       WillPopScope(
        onWillPop: onWillPop,
          child: const TabPage());
    }

    return const SplashScreen();

  }
}
