import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/chat/route/chat_route.dart';
import 'package:odhani_design_sqt/app/query/component/query_component_widget.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../utils/common_utils/custom_app_bar.dart';
import '../domain/query_list_model.dart';
class QueryPage extends StatefulWidget {
  const QueryPage({super.key});

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
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
        title: "Query",
        action: GestureDetector(
            onTap: () {

            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        itemCount: QueryListModel.queryList.length,
        itemBuilder: (context, index) {
          final data = QueryListModel.queryList[index];
          return GestureDetector(
            onTap: () {
              ChatRoute.goToChatPage(context);
            },
            child: QueryListDataWidget(
              queryListModel: data,
            ),
          );

      },),
    );
  }
}
