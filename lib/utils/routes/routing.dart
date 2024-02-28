part of utils;

class Routes {
  Map<String, WidgetBuilder> routes = {
    AuthRoute.signInRoute : (context) => AuthRoute.signInChild,
    AuthRoute.introRoute : (context) => AuthRoute.introChild,
    AuthRoute.signUpRoute : (context) => AuthRoute.signUpChild,
    TabRoute.route : (context) => TabRoute.child,
    NotificationRoute.route : (context) => NotificationRoute.child,
    JobRoute.route : (context) => JobRoute.child
  };
}