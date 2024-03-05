import 'package:flutter/material.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../chat/route/chat_route.dart';
import '../component/query_component_widget.dart';
import '../domain/query_list_model.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

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
