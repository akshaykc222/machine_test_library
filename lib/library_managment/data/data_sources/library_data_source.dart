import 'package:machine_test_library/library_managment/data/models/book.dart';
import 'package:machine_test_library/library_managment/data/models/dash_board_model.dart';
import 'package:machine_test_library/library_managment/data/test_datas.dart';

abstract class LibraryDataSource {
  List<DashboardModel> getDashboard();
  List<BookModel> getBooks();
}

class LibraryDataSourceImpl extends LibraryDataSource {
  @override
  List<DashboardModel> getDashboard() {
    return TestData.testDashBoardData;
  }

  @override
  List<BookModel> getBooks() {
    return TestData.testBookData;
  }
}
