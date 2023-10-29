import 'package:machine_test_library/library_managment/presentation/themes/app_assets.dart';

import 'models/book.dart';
import 'models/dash_board_model.dart';

class TestData {
  static List<DashboardModel> get testDashBoardData => [
        DashboardModel(
            title: "All Books", content: "500", image: AppAssets.allBooks),
        DashboardModel(
            title: "Books Taken", content: "5", image: AppAssets.taken),
        DashboardModel(
            title: "Books Return", content: "10", image: AppAssets.retBooks),
      ];
  static List<BookModel> get testBookData =>
      [  BookModel(title: 'Book 1', author: 'Author A'),
        BookModel(title: 'Book 2', author: 'Author B'),
        BookModel(title: 'Book 3', author: 'Author C'),
        BookModel(title: 'Book 4', author: 'Author D'),
        BookModel(title: 'Book 5', author: 'Author E'),];
}
