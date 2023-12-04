import 'package:google_huawei_availability/google_huawei_availability.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedtest/app/app.locator.dart';
import 'package:stackedtest/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    _navigationService.replaceWithHomeView();
    // bool isGoogle =
    //     await GoogleHuaweiAvailability.isGoogleServiceAvailable ?? false;

    // // Huawei Services
    // bool isHuawei =
    //     await GoogleHuaweiAvailability.isHuaweiServiceAvailable ?? false;

    //     if(isGoogle) {
    //       _navigationService.replaceWithHomeView();
    //     } else if(isHuawei) {
    //       _navigationService.replaceWithMapView();
    //       }
  }
}
