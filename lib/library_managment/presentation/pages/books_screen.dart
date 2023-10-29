import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_library/library_managment/data/models/book.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';
import 'package:machine_test_library/library_managment/presentation/themes/app_assets.dart';

import '../themes/app_colors.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  "All Books",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.bookData.length,
                itemBuilder: (context, index) =>
                    BookListCard(title: controller.bookData[index])),
          ),
        ],
      ),
    );
  }
}

class BookListCard extends StatelessWidget {
  final BookModel title;
  final Function(BookModel item)? returnBook;
  const BookListCard({super.key, required this.title, this.returnBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      decoration: BoxDecoration(
        // color: AppColors.offWhite1,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 20),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(AppAssets.allBooks),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title.title,
                              style: const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: returnBook == null
                              ? const SizedBox()
                              : TextButton(
                                  onPressed: () => returnBook!(title),
                                  child: const Text("Return"),
                                ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
