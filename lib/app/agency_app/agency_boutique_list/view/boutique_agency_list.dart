import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../boutique_app/customer_list/component/customer_data_component.dart';
import '../../../boutique_app/customer_list/domian/dummy/customer_list_data_model.dart';
import '../../../boutique_app/customer_list/route/customer_route.dart';

class BoutiqueAgencyList extends StatefulWidget {
  const BoutiqueAgencyList({super.key});

  @override
  State<BoutiqueAgencyList> createState() => _BoutiqueAgencyListState();
}

class _BoutiqueAgencyListState extends State<BoutiqueAgencyList> {
  @override
  Widget build(BuildContext context) {

    final screenType = ModalRoute.of(context)?.settings.arguments as ScreenType?;

    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        title: (screenType == ScreenType.CUSTOMER) ? "Customer List" : "Agency List",

        action: GestureDetector(
            onTap: () {
              // NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        itemCount:  CustomerListDataModel.boutiqueDummyList.length,
        itemBuilder: (context, index) {

          final customerListData = CustomerListDataModel.boutiqueDummyList[index];
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
