import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';
import 'package:machine_test_library/library_managment/presentation/pages/take_book_screen.dart';

import '../themes/app_colors.dart';

class ReturnBooksScreen extends StatelessWidget {
  const ReturnBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: .0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Return Books",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          TakenBooks(
            returnBooks: (item) {
              controller
                  .buildDialog('Are you sure you want to return the book?', () {
                controller.takenBooks.remove(item);
                Get.back();
              });
            },
          )
        ],
      ),
    );
  }
}
