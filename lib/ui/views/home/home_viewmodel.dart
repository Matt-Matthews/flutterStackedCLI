import 'package:stacked_services/stacked_services.dart';
import 'package:stackedtest/app/app.locator.dart';
import 'package:stackedtest/app/app.router.dart';
import 'package:stackedtest/models/book.dart';
import 'package:stackedtest/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedtest/ui/views/home/home_view.form.dart';

class HomeViewModel extends FutureViewModel<List<Book>> with FormStateHelper {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  get counterLabel => null;
  @override
  Future<List<Book>> futureToRun() =>
      _apiService.getBooks(genreType: searchTermsValue ?? 'computers');

  Future<void> fetchNewCategory() async {
    // searchTermsValue
    await initialise(); // run the futureToRun function
  }

  Future<void> navigateToBook({required Book book}) async {
    await _navigationService.navigateToBookDetailsView(book: book);
    // await _navigationService.navigateToMapView();
  }

  void showBottomSheet() {}

  void incrementCounter() {}
}
