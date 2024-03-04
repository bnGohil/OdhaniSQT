import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../home/view/home_page.dart';
import '../../menu/view/menu_page.dart';
import '../../order/domian/order_model.dart';
import '../../order/view/order_page.dart';
class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomePage(),
          OrderPage(),
          MenuPage()
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
            children: List.generate(TabModel.tabList.length, (index) {
              final tabData = TabModel.tabList[index];
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
