import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';
import 'package:machine_test_library/library_managment/presentation/widgets/over_view_Card.dart';

import '../themes/app_colors.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final col1 = controller.dashBoardData
        .skip(1)
        .map((e) => Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DashBoardCard(
                  image: e.image, title: e.title, content: e.content),
            )))
        .toList();
    final col2 = Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                controller.dashBoardData.first.image,
                width: 15,
                height: 15,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                controller.dashBoardData.first.title,
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.37)),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              controller.dashBoardData.first.content,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Overview",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Row(
            children: col1,
          ),
          col2
        ],
      ),
    );
  }
}
