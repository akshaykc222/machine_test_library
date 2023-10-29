import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_library/library_managment/presentation/routes/app_routes.dart';
import 'package:machine_test_library/library_managment/presentation/themes/app_themes.dart';

class LibraryManagement extends StatelessWidget {
  const LibraryManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.appPages,
      initialRoute: AppRoutes.initialRoute(),
      theme: AppTheme.theme1,
    );
  }
}
