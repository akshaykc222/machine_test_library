import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test_library/library_managment/data/models/book.dart';
import 'package:machine_test_library/library_managment/data/models/dash_board_model.dart';
import 'package:machine_test_library/library_managment/domain/use_cases/get_dash_board_use_case.dart';

import '../../../domain/use_cases/get_book_use_case.dart';
import '../../routes/app_pages.dart';
import '../../themes/app_constants.dart';
import '../../widgets/bottom_navigation_bar.dart';

class DashboardController extends GetxController {
  final GetDashBoardUseCase
      getDashBoardUseCase; //getting dashboard data from data source
  final GetBooksUseCase bookUseCase; //getting books from datasource
  DashboardController(this.getDashBoardUseCase, this.bookUseCase);
  List<DashboardModel> dashBoardData = [];
  List<BookModel> bookData = [];
  final takenBooks = <BookModel>[].obs;

  BookModel? selectedBook; //to take book
  getDashBoard() {
    dashBoardData = getDashBoardUseCase.call();
  }

  getBooks() {
    bookData = bookUseCase.call();
  }

  final loginKey = GlobalKey<FormState>();
  login({required String email, required String password}) async {
    if (loginKey.currentState!.validate()) {
      if (email == "test@user.com" && password == "123456") {
        var storage = GetStorage();
        await storage.write(AppConstants.login, true);
        Get.offAllNamed(AppPages.home);
      }
    }
  }

  buildDialog(String title, Function buildFunction) {
    Get.defaultDialog(
      title: title,
      content: const Text('This action cannot be undone.'),
      actions: [
        ElevatedButton(
          onPressed: () => buildFunction(),
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: const Text('No'),
        ),
      ],
    );
  }

  final currentBotIndex = CustomBottomNavigationItems
      .dashboard.obs; //selected index of bottom navigation

  @override
  void onInit() {
    getDashBoard();
    getBooks();
    super.onInit();
  }
}
