import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../boutique_app/customer_list/domian/dummy/customer_order_data_model.dart';
import '../../../boutique_app/order/component/completed_order_list_widget.dart';

class BoutiqueAgencyDetailsView extends StatefulWidget {
  const BoutiqueAgencyDetailsView({super.key});

  @override
  State<BoutiqueAgencyDetailsView> createState() => _BoutiqueAgencyDetailsViewState();
}

class _BoutiqueAgencyDetailsViewState extends State<BoutiqueAgencyDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
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
                // CompletedOrderAgencyRoute.goToCompletedOrderDetailsAgencyPage(context);
              },
              child: CompletedOrderListWidget(customerData: customerData)
          );
        },),
    );
  }
}
