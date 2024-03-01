import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/app/menu/domian/menu_model.dart';
import 'package:odhani_design_sqt/app/personal/route/personal_route.dart';

import 'package:odhani_design_sqt/app/report/route/report_route.dart';

import 'package:odhani_design_sqt/app/query/route/query_route.dart';

import 'package:odhani_design_sqt/app/tab/domian/tab_model.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../base/view/base_components/custom_option_bottom_sheet.dart';
import '../../customer_list/route/customer_route.dart';
import '../../gallery/route/gallery_route.dart';
import '../../order/route/order_route.dart';
import '../../profile/route/profile_route.dart';
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {


  int selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: kToolbarHeight + 110.sp,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.sp),
            topRight: Radius.circular(25.sp),
          ),
          image: const DecorationImage(image: AssetImage("assets/images/graphics/card_back_ground.png"),fit: BoxFit.fill)
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.sp),
                      child: Container(
                        padding: EdgeInsets.all(14.sp),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: kBorderColor),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text("Menu",style: CustomTextStyle.mediumFont18Style.copyWith(
                                  color: kBlackColor
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(14.sp),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: kBorderColor),
                    ),
                    child: ImageUtil.iconImageClass.notificationIcon,
                  ),
                ],
              ),
              SizedBox(height: 15.sp,),
              GestureDetector(
                onTap: () {
                  ProfileRoute.goToProfilePage(context);
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 80.sp,
                      width: 80.sp,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/images/dummy_img/image_1.png",fit: BoxFit.cover,)),
                    ),
                    SizedBox(width: 10.sp,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kajal Patel",style: CustomTextStyle.semiBoldRegularFont20Style,),
                        Text("Boutique",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),)
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      ),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
        itemCount: MenuModel.menuList.length,
        itemBuilder: (context, index) {
        final menu = MenuModel.menuList[index];
        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 2.sp),
              child: GestureDetector(
                onTap: () {
                  switch(menu.menuType){
                    case MenuType.BoutiqueDetail:
                      PersonalRoute.goToPersonalDetailsPage(context);
                      break;
                    case MenuType.CustomerList:
                      CustomerRoute.goToCustomerListPage(context,ScreenType.CUSTOMER);
                      break;
                    case MenuType.AgencyList:
                      CustomerRoute.goToCustomerListPage(context,ScreenType.AGENCY);
                      break;
                    case MenuType.CompletedOrders:
                    // TODO: Handle this case.
                      break;
                    case MenuType.Report:
                      ReportRoute.goToReportPage(context);
                      break;

                    case MenuType.Query:
                    QueryRoute.goToQueryPage(context);
                      break;
                    case MenuType.Gallery:
                      GalleryRoute.goToGalleryPage(context);
                      break;
                    case MenuType.DeleteAccount:
                      // return ;
                      break;
                    case MenuType.Logout:
                      CustomShowModalBottomSheetPopup(context,
                          title: "Logout",
                          message: "Are you sure you want to logout?",
                          primaryBtnTxt: "Yes",
                          secondaryBtnTxt: "Cancel",
                          primaryAction: () {
                            // userProvider.logoutAccount();
                            // lendingProvider.clearAppState();
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },
                          secondaryAction: (){

                          }
                      );
                    // case null:
                    //   print("TYerst ");

                      default:
                        return ;
                  }
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 15.sp),
                  child: Row(
                    children: [
                      Expanded(child: Text(menu.menuType?.menuType ?? "",style: CustomTextStyle.regularFont18Style,)),
                      Icon(Icons.arrow_forward_ios_outlined,color: kBlackColor,size: 18.sp,)
                    ],
                  ),
                ),

              ),
            ),
            
            Container(height: 1.sp,width: double.infinity,color: Colors.grey.withOpacity(0.2),)
          ],
        );
      },),

    );
  }
}
