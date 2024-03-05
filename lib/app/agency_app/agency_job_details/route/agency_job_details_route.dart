import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/sizer/enum.dart';

import '../view/agency_job_details_page.dart';

class AgencyJobDetailsRoute{

  static String agencyJobDetailsRoute = "agency_job_details_route";

  static Widget agencyJobDetailsChild = const AgencyJobDetailsPage();

  static  goToAgencyJobDetailsPage(BuildContext context,GetHomeAgencyData? getHomeAgencyData){
    Navigator.pushNamed(context,agencyJobDetailsRoute,arguments: getHomeAgencyData);
  }

}
class GetHomeAgencyData{
  JobStatus? jobStatus;
  int? index;

  GetHomeAgencyData({this.jobStatus,this.index});

}
