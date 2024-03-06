import '../../../../base/base.dart';
import '../../../../utils/utils.dart';
import 'package:flutter/material.dart';
import '../domin/ui_state/app_state_model.dart';
import '../repository/lending_repository.dart';
import '../../../../services/secure_storage.dart';
import '../domin/ui_state/set_add_state_model.dart';
import '../../../../base/view/base_components/custom_button.dart';

abstract class ILendingProvider {
  Future setAppState(SetAddStateModel setAddStateModel);
  Future getAppState();
  Future clearAppState();
}


class LendingProvider extends BaseNotifier implements ILendingProvider {
  late final ILendingRepository lendingRepository;
  AppStateModel? appStateModel;
  String? userId;
  String? associationId;
  String? token;
  String? email;
  bool? isLogin;

  bool isUnderMaintenance = false;
  bool isMajorUpdate = false;
  bool isMinorUpdate = false;

  bool? isLocalAuthEnabled;
  bool? isLocalAuth;

  LendingProvider({required this.lendingRepository}) {
    initial();
  }
  bool isUserIDLoading = true;
  SecureStorage secureStorage = SecureStorage();

  initial() async {
    await getAppState();
  }

  @override
  Future getAppState() async{
    await Future.delayed(Duration(seconds: 3));
    try {
      appStateModel = await lendingRepository.getAppState();

      isLogin = appStateModel?.isLogin ?? false;

    } catch (e) {

      appStateModel = AppStateModel(isLogin: false);

    } finally {
      if(userId == null){

        await getLocalStorageData();

      }
      notifyListeners();
    }
  }

  setIsLocalEnabled({required bool isOn}) {
    isLocalAuthEnabled = isOn;
    isLocalAuth = true;
    notifyListeners();

  }

  setIsLocalAuthenticated() {
    isLocalAuth = true;
    notifyListeners();
  }

  getLocalStorageData() async{
    try {
      if(isLogin == true) {
        isUserIDLoading = true;
        SecureStorage.token = await secureStorage.getToken();
        SecureStorage.userID = await secureStorage.getUserId();
        SecureStorage.associationID = await secureStorage.getAssociationId();
        userId = SecureStorage.userID;
        token = SecureStorage.token;
        associationId = SecureStorage.associationID;
      }
    } catch (e) {
      print(e);
    } finally {
      isUserIDLoading = false;
    }
    notifyListeners();
  }

  @override
  Future clearAppState() async{
    appStateModel = AppStateModel(isLogin: false);
    associationId = null;
    userId = null;
    token = null;
    isLogin = false;
    notifyListeners();
    await lendingRepository.clearAppState();
    notifyListeners();
  }

  @override
  Future setAppState(SetAddStateModel setAddStateModel) async{
    await lendingRepository.setAppStateForLogin(setAddStateModel);
    await getAppState();
    notifyListeners();
  }


  // manageAppSettings({required bool? isUnderMaintenance, required String? majorVersion, required String? minorVersion}) async {
  //
  //   if(isUnderMaintenance != null) {
  //     if(isUnderMaintenance) {
  //       this.isUnderMaintenance = isUnderMaintenance;
  //       notifyListeners();
  //       return;
  //     }
  //   }
  //
  //   if(majorVersion == null || minorVersion == null) {
  //     return;
  //   }
  //
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //
  //   String deviceVersion = packageInfo.version;
  //
  //   isMajorUpdate = compareVersion(serverVersion: majorVersion, deviceVersion: deviceVersion);
  //   isMinorUpdate = compareVersion(serverVersion: minorVersion, deviceVersion: deviceVersion);
  //
  //   notifyListeners();
  //
  // }

  bool compareVersion({required String serverVersion, required String deviceVersion}) {

    if(!serverVersion.contains(".")) {
      return false;
    }


    final serverVersionDivided = serverVersion.split(".").map((e) => int.parse(e)).toList();
    final deviceVersionDivided = deviceVersion.split(".").map((e) => int.parse(e)).toList();

    int smallerNumber = serverVersionDivided.length < deviceVersionDivided.length ?  serverVersionDivided.length : deviceVersionDivided.length;

    bool isServerBigger = false;

    for(var i = 0; i < smallerNumber; i++) {
      // Check if both versions are same
      if(deviceVersionDivided[i] == serverVersionDivided[i]) {
        continue;
      }

      // Check if higher level value version is bigger EX. in 1.0.3 first it will check 1 and then 0 and later 3
      if(serverVersionDivided[i] < deviceVersionDivided[i]) {
        isServerBigger = false;
        break;
      }

      // Check if higher level value version is Smaller EX. in 1.0.3 first it will check 1 and then 0 and later 3
      if(serverVersionDivided[i] > deviceVersionDivided[i]) {
        isServerBigger = true;
        break;
      }
    }

    return isServerBigger;

  }
}


class ErrorBuilder extends StatelessWidget {
  const ErrorBuilder({Key? key, required this.message, required this.onRetry, this.isLoading}) : super(key: key);

  final String message;
  final Function() onRetry;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: ImageUtil.logo.appLogo),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message,style: CustomTextStyle.blackRegularFont16Style),
                    SizedBox(
                        height: 25.sp
                    ),
                    CustomButton(btnText: "Retry",onTap: () {
                      onRetry();
                    },isLoading: isLoading),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
