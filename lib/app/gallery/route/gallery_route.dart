import 'package:flutter/cupertino.dart';
import 'package:odhani_design_sqt/app/gallery/view/gallery_page.dart';

class GalleryRoute{

  static String route = "/galley_route";

  static Widget child = const GalleryPage();

  static goToGalleryPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }


}