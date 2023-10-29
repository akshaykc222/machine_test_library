import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test_library/library_managment/presentation/manager/bindings/dashboard_binding.dart';
import 'package:machine_test_library/library_managment/presentation/pages/home_screen.dart';
import 'package:machine_test_library/library_managment/presentation/pages/login_page.dart';
import 'package:machine_test_library/library_managment/presentation/themes/app_constants.dart';

import 'app_pages.dart';

class AppRoutes {
  static String initialRoute() {
    var storage = GetStorage();
    bool login = storage.read(AppConstants.login);
    print("Login $login");
    if (login) {
      return AppPages.home;
    }
    return AppPages.login;
  }

  static List<GetPage> appPages = [
    GetPage(
        name: AppPages.login,
        page: () => const LoginPage(),
        binding: DashBoardBinding()),
    GetPage(
        name: AppPages.home,
        page: () => const HomeScreen(),
        binding: DashBoardBinding()),
  ];
}
