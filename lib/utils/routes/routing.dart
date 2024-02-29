part of utils;

class Routes {
  Map<String, WidgetBuilder> routes = {
    AuthRoute.signInRoute : (context) => AuthRoute.signInChild,
    AuthRoute.introRoute : (context) => AuthRoute.introChild,
    AuthRoute.signUpRoute : (context) => AuthRoute.signUpChild,
    AuthRoute.forgotRoute : (context) => AuthRoute.forgotChild,
    AuthRoute.changePasswordRoute : (context) => AuthRoute.changePasswordChild,
    TabRoute.route : (context) => TabRoute.child,
    JobRoute.route : (context) => JobRoute.child,
    OrderRoute.createOrderRoute: (context) => OrderRoute.createOrderChild,
    OrderRoute.createSubOrderDetailsRoute: (context) => OrderRoute.createSubOrderDetailsChild,
    NotificationRoute.route : (context) => NotificationRoute.child,
    OrderRoute.orderDetailRoute : (context) => OrderRoute.child,
    OrderRoute.orderCompletedRoute : (context) => OrderRoute.completedChild,
    JobRoute.route : (context) => JobRoute.child,
    ChatRoute.route : (context) => ChatRoute.child,
    ProfileRoute.route : (context) => ProfileRoute.child,
    ProfileRoute.editRoute : (context) => ProfileRoute.editChild,
    PersonalRoute.route : (context) => PersonalRoute.child,
    PersonalRoute.editPerRoute : (context) => PersonalRoute.editChild
  };
}