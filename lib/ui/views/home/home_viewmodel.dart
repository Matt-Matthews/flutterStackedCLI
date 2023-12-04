import 'package:flutter/foundation.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedtest/app/app.locator.dart';
import 'package:stackedtest/app/app.router.dart';
import 'package:stackedtest/models/book.dart';
import 'package:stackedtest/models/todo.dart';
import 'package:stackedtest/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedtest/services/sql_service.dart';
import 'package:stackedtest/ui/views/home/home_view.form.dart';
import 'package:homescreen/map_viewmodel.dart';
import 'package:stackedtest/utils/todo_db.dart';

class HomeViewModel extends FutureViewModel<List<Book>> with FormStateHelper {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  var viewModel = MapViewModel();
  final _sqlService = locator<SqlService>();

  get counterLabel => null;
  @override
  Future<List<Book>> futureToRun() =>
      _apiService.getBooks(genreType: searchTermsValue ?? 'computers');

  Future<void> fetchNewCategory() async {
    await initialise(); // run the futureToRun function
  }

  Future<void> navigateToBook({required Book book}) async {
    await _navigationService.navigateToBookDetailsView(book: book);
  }

  Future<void> navigateToMap() async {
    await _navigationService.navigateToMapView(data: 'testing view models',);
  }

  late Future<List<Todo>?> _futureTodos;
  final todoDB = TodoDB();

  Future<List<Todo>?> get futureTodos => _futureTodos;

  void createSql() {
    _sqlService.testHive();
    _futureTodos = todoDB.fetchAll();
    _futureTodos.then((value) async {
      print('👌👌 ${value!.length}');
      if (value.isEmpty) {
        todoDB.create(title: 'this is a test title');
        _futureTodos = todoDB.fetchAll();
        print('😒😒 $_futureTodos');
      } else {
        if (kDebugMode) {
          print('👍👍👍 ${value[0].title}');
        }
      }
    });
  }

  void showBottomSheet() {}

  void incrementCounter() {}
}
