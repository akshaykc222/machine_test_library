import '../models/book.dart';
import '../models/dash_board_model.dart';

abstract class LibraryRepository {
  List<DashboardModel> getDashboard();
  List<BookModel> getBooks();
}
