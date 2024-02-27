import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/tab/domian/tab_model.dart';
import 'package:odhani_design_sqt/utils/common_utils/custom_tabbar_view.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../utils/common_utils/custom_app_bar.dart';
import '../../app_custom_component/jobs_and_order_card.dart';
import '../../home/domian/dummy/jobs_and_order_dummy_model.dart';
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {


  int selectedIndex = 0;

  List<String> tabList = ["Orders","Jobs"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: CustomAppbar(
        height: 100.sp,
        leading: SizedBox(
          height: 24.sp,
          width: 24.sp,
          child: ImageUtil.iconImageClass.searchIcon,
        ),
        title: "Order",
        action: SizedBox(
          child: ImageUtil.iconImageClass.notificationIcon,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 5.sp,),
          CustomTabBarView(
            tabList: tabList,
            callBackFun: (p0) {
              setState(() {
                print("selected Po is $p0");
              });
            },
          ),
          SizedBox(height: 5.sp,),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            itemCount: JobsAndOrderDummyModel.jobsListData.length,
            itemBuilder: (context, index) {
              final jobsAndOrderDummyModel = JobsAndOrderDummyModel.jobsListData[index];
              return JobsAndOrderCardWidget(
                jobsAndOrderDummyModel: jobsAndOrderDummyModel,
              );
            },))
        ],
      ),

    );
  }
}
