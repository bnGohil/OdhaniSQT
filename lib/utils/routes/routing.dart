part of utils;

class Routes {
  Map<String, WidgetBuilder> routes = {
    TabRoute.route : (context) => TabRoute.child,
    OrderRoute.route : (context) => OrderRoute.child,
    MenuRoute.route : (context) => MenuRoute.child,
    HomeRoute.route : (context) => HomeRoute.child,
  };
}