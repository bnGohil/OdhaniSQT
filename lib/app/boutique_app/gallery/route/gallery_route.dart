import 'package:flutter/cupertino.dart';

import '../view/gallery_page.dart';

class GalleryRoute{

  static String route = "/galley_route";

  static Widget child = const GalleryPage();

  static goToGalleryPage(BuildContext context){
    Navigator.pushNamed(context,route);
  }


}