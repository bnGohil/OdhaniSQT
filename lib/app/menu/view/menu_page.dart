import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/app/menu/domian/menu_model.dart';
import 'package:odhani_design_sqt/app/personal/route/personal_route.dart';
import 'package:odhani_design_sqt/app/tab/domian/tab_model.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

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
        return GestureDetector(
          onTap: () {
            switch(menu.menuType){
              case MenuType.BoutiqueDetail:
                PersonalRoute.goToPersonalDetailsPage(context);
              case MenuType.CustomerList:
                // TODO: Handle this case.
              case MenuType.AgencyList:
                // TODO: Handle this case.
              case MenuType.CompletedOrders:
                // TODO: Handle this case.
              case MenuType.Report:
                // TODO: Handle this case.
              case MenuType.Query:
                // TODO: Handle this case.
              case MenuType.Gallery:
                // TODO: Handle this case.
              case MenuType.DeleteAccount:
                // TODO: Handle this case.
              case MenuType.Logout:
                // TODO: Handle this case.
              case null:
              // TODO: Handle this case.
            }
          },
          child: Column(
            children: [
              SizedBox(height: 10.sp,),
              Row(
                children: [
                  Expanded(child: Text(menu.menuType?.menuType ?? "",style: CustomTextStyle.regularFont18Style,)),
                  Icon(Icons.arrow_forward_ios_outlined,color: kBlackColor,size: 18.sp,)
                ],
              ),
              SizedBox(height: 10.sp,),
              const Divider(color: Color(0xffD9D9D9),)
            ],
          ),
        );
      },),

    );
  }
}
