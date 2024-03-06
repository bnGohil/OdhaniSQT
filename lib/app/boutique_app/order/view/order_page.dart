import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../app_custom_component/jobs_and_order_card.dart';
import '../../home/domian/dummy/jobs_and_order_dummy_model.dart';
import 'package:odhani_design_sqt/utils/common_utils/custom_tabbar_view.dart';

import '../../job/route/job_route.dart';
import '../route/order_route.dart';

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
        actionWidget: GestureDetector(
          onTap: (){
            selectedIndex == 0
                ? OrderRoute.goToCreateOrderPage(context)
                : JobRoute.goToCreateJobPage(context);
          },
          child: Container(
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kBorderColor),
            ),
            child: CustomSvgPictures.asset("$iconPath/add.svg", fit: BoxFit.cover,color: Colors.black,height: 30.sp,width: 30.sp,),
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 5.sp,),
          CustomTabBarView(
            tabList: tabList,
            callBackFun: (p0) {
              setState(() {
                selectedIndex = p0;
                print("selected Po is $p0");
              });
            },
          ),
          SizedBox(height: 5.sp,),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            itemCount: !(selectedIndex == 0) ? JobsAndOrderDummyModel.jobsListData.length : JobsAndOrderDummyModel.orderListData.length,
            itemBuilder: (context, index) {
              final jobsAndOrderDummyModel = !(selectedIndex == 0) ? JobsAndOrderDummyModel.jobsListData[index] : JobsAndOrderDummyModel.orderListData[index];
              return GestureDetector(
                onTap: () {
                  if(selectedIndex == 0){

                    OrderRoute.goToOrderDetailsPage(context);

                  }else{

                    JobRoute.goToJobDetailsPage(context);

                  }
                },
                child: JobsAndOrderCardWidget(
                  jobsAndOrderDummyModel: jobsAndOrderDummyModel,
                ),
              );
            },))
        ],
      ),

    );
  }
}
