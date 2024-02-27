part of utils;

class Routes {
  Map<String, WidgetBuilder> routes = {
    AuthRoute.signInRoute : (context) => AuthRoute.signInChild,
    AuthRoute.introRoute : (context) => AuthRoute.introChild,
    AuthRoute.signUpRoute : (context) => AuthRoute.signUpChild,
  };
}