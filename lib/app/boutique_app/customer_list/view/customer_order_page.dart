import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../domian/dummy/customer_order_data_model.dart';
import '../../notification/route/notification_route.dart';
import '../../order/component/completed_order_list_widget.dart';
class CustomerOrderPage extends StatefulWidget {
  const CustomerOrderPage({super.key});

  @override
  State<CustomerOrderPage> createState() => _CustomerOrderPageState();
}

class _CustomerOrderPageState extends State<CustomerOrderPage> {



  @override
  Widget build(BuildContext context) {

    final screenType = ModalRoute.of(context)?.settings.arguments as ScreenType?;

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
        title: (screenType == ScreenType.CUSTOMER) ? "pooja’s Orders" : "Agency’s orders",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 35.sp,
                    height: 35.sp,
                    child: Image.asset(GetCustomerDummyData.getCustomerData.profilePic ?? "")),
                SizedBox(width: 10.sp,),
                Expanded(child: Text((screenType == ScreenType.CUSTOMER) ? (GetCustomerDummyData.getCustomerData.name ?? "") : (GetCustomerDummyData.getAgencyData.name ?? ""),style: CustomTextStyle.semiBoldFont18Style,))
              ],
            ),
            SizedBox(height: 10.sp,),
            Expanded(
              child: ListView.builder(
                itemCount: (screenType == ScreenType.CUSTOMER) ? GetCustomerDummyData.getCustomerData.list?.length : GetCustomerDummyData.getAgencyData.list?.length,
                itemBuilder: (context, index) {
                  final customerData = (screenType == ScreenType.CUSTOMER) ? GetCustomerDummyData.getCustomerData.list![index] : GetCustomerDummyData.getAgencyData.list![index];
                  return CompletedOrderListWidget(customerData: customerData);

              },),
            )
          ],
        ),
      ),
    );
  }
}
