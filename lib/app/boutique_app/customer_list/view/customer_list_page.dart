import '../route/customer_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/customer_data_component.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../domian/dummy/customer_list_data_model.dart';
import '../../notification/route/notification_route.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {

    final screenType = ModalRoute.of(context)?.settings.arguments as ScreenType?;

    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        title: (screenType == ScreenType.CUSTOMER) ? "Customer List" : "Agency List",

        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        itemCount: screenType == ScreenType.CUSTOMER ?  CustomerListDataModel.customerList.length : CustomerListDataModel.agencyList.length,
        itemBuilder: (context, index) {

          final customerListData = (screenType == ScreenType.CUSTOMER) ? CustomerListDataModel.customerList[index] : CustomerListDataModel.agencyList[index];
          return GestureDetector(
            onTap: () {
              CustomerRoute.goToCustomerOrderPage(context,screenType);
            },
            child: CustomerDataComponentWidget(
              customerListData: customerListData,
            ),
          );

        },),
    );
  }
}
