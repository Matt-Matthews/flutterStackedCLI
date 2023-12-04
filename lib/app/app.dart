import 'package:stackedtest/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stackedtest/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stackedtest/ui/views/home/home_view.dart';
import 'package:stackedtest/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedtest/services/api_service.dart';
import 'package:stackedtest/ui/views/book_details/book_details_view.dart';
import 'package:homescreen/map_view.dart';
import 'package:stackedtest/services/sql_service.dart';
import 'package:stackedtest/services/database_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: BookDetailsView),
    MaterialRoute(page: MapView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: SqlService),
    LazySingleton(classType: DatabaseService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
