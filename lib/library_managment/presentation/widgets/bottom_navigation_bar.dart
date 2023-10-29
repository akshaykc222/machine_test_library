import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';

import '../themes/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  final controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 77,
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, -1),
            )
          ]),
          child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: CustomBottomNavigationItems.values
                  .map(
                    (menu) => Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkResponse(
                          splashFactory: InkRipple.splashFactory,
                          radius: 30,
                          splashColor: Colors.black12,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            controller.currentBotIndex.value = menu;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                getHomeIcon(menu),
                                color: controller.currentBotIndex.value != menu
                                    ? Colors.grey
                                    : AppColors.blue,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${menu.name[0].toUpperCase()}${menu.name.substring(1)}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      controller.currentBotIndex.value != menu
                                          ? Colors.grey
                                          : Colors.blue.withOpacity(0.7),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList())),
        ),
      ],
    );
  }
}

enum CustomBottomNavigationItems {
  dashboard,
  books,
  take,
  returnM,
}

IconData getHomeIcon(CustomBottomNavigationItems menu) {
  switch (menu) {
    case CustomBottomNavigationItems.dashboard:
      return FeatherIcons.menu;
    case CustomBottomNavigationItems.books:
      return FeatherIcons.book;
    case CustomBottomNavigationItems.take:
      return FeatherIcons.bookmark;
    case CustomBottomNavigationItems.returnM:
      return FeatherIcons.cornerDownLeft;
  }
}
