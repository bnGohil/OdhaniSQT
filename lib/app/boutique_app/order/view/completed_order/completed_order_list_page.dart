import '../../route/order_route.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../../utils/common_utils/custom_app_bar.dart';
import '../../../notification/route/notification_route.dart';
import '../../component/completed_order_list_widget.dart';
import '../../../customer_list/domian/dummy/customer_order_data_model.dart';
class CompletedOrderListPage extends StatefulWidget {
  const CompletedOrderListPage({super.key});

  @override
  State<CompletedOrderListPage> createState() => _CompletedOrderListPageState();
}

class _CompletedOrderListPageState extends State<CompletedOrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        title: "Complete Order",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
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
              OrderRoute.goToCompletedOrderDetails(context);
            },
            child: CompletedOrderListWidget(customerData: customerData));
      },),
    );
  }
}
