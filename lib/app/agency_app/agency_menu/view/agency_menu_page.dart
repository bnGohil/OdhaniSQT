import 'package:odhani_design_sqt/app/agency_app/agency_boutique_list/route/agency_boutique_route.dart';

import '../../../../utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../boutique_app/menu/domian/menu_model.dart';
import '../../agency_completed_order/route/completed_order_agency_route.dart';
import '../../../../base/view/base_components/custom_option_bottom_sheet.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_query/route/query_agency_route.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_report/route/report_agency_route.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_profile/route/agency_profile_route.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_details/route/personal_agency_detail_route.dart';

class AgencyMenuPage extends StatefulWidget {
  const AgencyMenuPage({super.key});

  @override
  State<AgencyMenuPage> createState() => _AgencyMenuPageState();
}

class _AgencyMenuPageState extends State<AgencyMenuPage> {
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
                    ProfileAgencyRoute.goToProfilePage(context);
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
                          Text("Seema Chauhan",style: CustomTextStyle.semiBoldRegularFont20Style,),
                          Text("Agency",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),)
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
        itemCount: AgencyMenuModel.menuAgencyList.length,
        itemBuilder: (context, index) {
          final menu = AgencyMenuModel.menuAgencyList[index];
          return Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 2.sp),
                child: GestureDetector(
                  onTap: () {
                    switch(menu.menuAgencyType){
                      case MenuAgencyType.AgencyDetail:
                      PersonalAgencyRoute.goToPersonalDetailsPage(context);
                        break;
                      case MenuAgencyType.CompletedOrders:
                        CompletedOrderAgencyRoute.goToCompletedOrderAgencyPage(context);
                        break;
                      case MenuAgencyType.BoutiqueList:
                        // CustomerRoute.goToCustomerListPage(context,ScreenType.AGENCY);
                      BoutiqueListRoute.goToCustomerListPage(context);
                        break;
                      case MenuAgencyType.Report:
                        ReportAgencyRoute.goToReportPage(context);
                        break;
                      case MenuAgencyType.Query:
                        QueryAgencyRoute.goToQueryPage(context);
                        break;
                      case MenuAgencyType.DeleteAccount:
                        break;
                      case MenuAgencyType.Logout:
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
                        break;

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
                        Expanded(child: Text(menu.menuAgencyType?.menuAgencyType ?? "",style: CustomTextStyle.regularFont18Style,)),
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
