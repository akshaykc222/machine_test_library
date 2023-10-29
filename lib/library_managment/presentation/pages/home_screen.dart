import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';
import 'package:machine_test_library/library_managment/presentation/pages/books_screen.dart';
import 'package:machine_test_library/library_managment/presentation/pages/dashboard.dart';
import 'package:machine_test_library/library_managment/presentation/pages/return_books.dart';
import 'package:machine_test_library/library_managment/presentation/pages/take_book_screen.dart';
import 'package:machine_test_library/library_managment/presentation/routes/app_pages.dart';
import 'package:machine_test_library/library_managment/presentation/themes/app_colors.dart';
import 'package:machine_test_library/library_managment/presentation/themes/app_constants.dart';
import 'package:machine_test_library/library_managment/presentation/widgets/bottom_navigation_bar.dart';
import 'package:machine_test_library/library_managment/presentation/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    Widget getHomeScreen() {
      switch (controller.currentBotIndex.value) {
        case CustomBottomNavigationItems.dashboard:
          return const DashBoardScreen();
        case CustomBottomNavigationItems.books:
          return const BookScreen();
        case CustomBottomNavigationItems.take:
          return const TakeBookScreen();
        case CustomBottomNavigationItems.returnM:
          return const ReturnBooksScreen();
      }
    }

    return Scaffold(
      appBar: getAppBar(context, () {
        controller.buildDialog('Are you sure you want to logout?', () async {
          Get.back();
          var storage = GetStorage();
          await storage.remove(AppConstants.login);
          Get.offAllNamed(AppPages.login);
        });
      }, height: 80),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() => getHomeScreen()),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
