import 'package:machine_test_library/library_managment/data/data_sources/library_data_source.dart';
import 'package:machine_test_library/library_managment/data/models/book.dart';
import 'package:machine_test_library/library_managment/data/models/dash_board_model.dart';
import 'package:machine_test_library/library_managment/data/repositories/library_repository.dart';

class LibraryRepositoryImpl extends LibraryRepository {
  final LibraryDataSource dataSource;

  LibraryRepositoryImpl(this.dataSource);

  @override
  List<DashboardModel> getDashboard() {
    return dataSource.getDashboard();
  }

  @override
  List<BookModel> getBooks() {
    return dataSource.getBooks();
  }
}
