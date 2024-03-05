import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_completed_order/route/completed_order_agency_route.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../boutique_app/order/component/completed_order_list_widget.dart';
import '../../../boutique_app/customer_list/domian/dummy/customer_order_data_model.dart';

class AgencyCompletedOrderScreen extends StatefulWidget {
  const AgencyCompletedOrderScreen({super.key});

  @override
  State<AgencyCompletedOrderScreen> createState() => _AgencyCompletedOrderScreenState();
}

class _AgencyCompletedOrderScreenState extends State<AgencyCompletedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.backArrowIcon,
          ),
        ),
        title: "Complete Order",
        action: GestureDetector(
            onTap: () {
              // NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        itemCount: GetCustomerDummyData.completedOrderList.list?.length,
        itemBuilder: (context, index) {
          final customerData = GetCustomerDummyData.completedOrderList.list?[index];
          return GestureDetector(
              onTap: () {
                CompletedOrderAgencyRoute.goToCompletedOrderDetailsAgencyPage(context);
              },
              child: CompletedOrderListWidget(customerData: customerData)
          );
        },),
    );
  }
}
