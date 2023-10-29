import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_library/library_managment/data/models/book.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';
import 'package:machine_test_library/library_managment/presentation/pages/books_screen.dart';

import '../themes/app_colors.dart';

class TakeBookScreen extends StatelessWidget {
  const TakeBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final controller = Get.find<DashboardController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: .0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Book",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: DropdownSearch<BookModel>(
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration:
                              InputDecoration(labelText: "select book"),
                        ),
                        popupProps: const PopupProps.bottomSheet(
                            title: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Select Book",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )),
                        items: controller.bookData,
                        itemAsString: (BookModel u) => u.title,
                        onChanged: (BookModel? data) {
                          if (controller.takenBooks.contains(data)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Book already taken.")));
                          } else {
                            controller.selectedBook = data;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: height * 0.07,
                      width: width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (controller.selectedBook != null) {
                              controller.takenBooks
                                  .add(controller.selectedBook!);
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(() => controller.takenBooks.isNotEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Taken Books",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              : const SizedBox()),
          const TakenBooks(),
        ],
      ),
    );
  }
}

class TakenBooks extends StatelessWidget {
  final Function(BookModel item)? returnBooks;

  const TakenBooks({this.returnBooks, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    return Obx(() => Expanded(
        child: controller.takenBooks.isEmpty
            ? const Center(child: Text("No books to return"))
            : ListView.builder(
                itemCount: controller.takenBooks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => BookListCard(
                      title: controller.takenBooks[index],
                      returnBook: returnBooks,
                    ))));
  }
}
