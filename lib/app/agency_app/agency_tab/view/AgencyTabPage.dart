import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_menu/view/agency_menu_page.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_order/view/agency_order_page.dart';

import '../../../../utils/utils.dart';
import '../../../boutique_app/home/view/home_page.dart';
import '../../../boutique_app/menu/view/menu_page.dart';
import '../../../boutique_app/order/domian/order_model.dart';
import '../../../boutique_app/order/view/order_page.dart';
import '../../agency_home/view/agency_home_page.dart';

class AgencyTabPage extends StatefulWidget {
  const AgencyTabPage({super.key});

  @override
  State<AgencyTabPage> createState() => _AgencyTabPageState();
}

class _AgencyTabPageState extends State<AgencyTabPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          AgencyHomePage(),
          AgencyOrderPage(),
          AgencyMenuPage()
        ],
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(20.sp),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 41.sp,vertical: 16.sp),
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(100.sp)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(TabModel.agencyTabList.length, (index) {
              final tabData = TabModel.agencyTabList[index];
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 24.sp,
                        width: 24.sp,
                        child: CustomSvgPictures.asset(tabData.icon ?? "",colorFilter: ColorFilter.mode(isSelected ? kBackground : kLightPinkPrimaryColor,BlendMode.srcIn),)),
                    Flexible(child: Text(tabData.name ?? "",style: CustomTextStyle.boldFont12Style.copyWith(
                        color: isSelected ? kBackground : kLightPinkPrimaryColor
                    ),))
                  ],),
              );
            }),
          ),
        ),
      ),
    );
  }
}
