import 'package:odhani_design_sqt/utils/utils.dart';
import 'package:provider/provider.dart';

import 'app/boutique_app/leanding/repository/lending_repository.dart';
import 'app/boutique_app/leanding/view_model/lending_provider.dart';

class AppProviders {


  /// Providers
  static get otpTimerProvider => ChangeNotifierProvider(create: (context) => OtpTimer());
  static get lendingProvider => ChangeNotifierProvider(create: (context) => LendingProvider(lendingRepository: LendingRepository()));

}