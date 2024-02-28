import 'package:odhani_design_sqt/utils/utils.dart';
import 'package:provider/provider.dart';

class AppProviders {


  /// Providers


  static get otpTimerProvider =>
      ChangeNotifierProvider(create: (context) => OtpTimer());


}