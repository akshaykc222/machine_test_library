import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';

import '../themes/app_colors.dart';
import '../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<DashboardController>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: controller.loginKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login to Continue...",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                    validator: (str) {
                      if (!GetUtils.isEmail(str)) {
                        return "Enter valid email!.";
                      }
                    },
                    label: const Text("Email")),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: passController,
                  hintText: "Password",
                  label: const Text("Password"),
                  passwordfield: true,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 45, 10, 15),
                    child: SizedBox(
                      height: height * 0.07,
                      width: width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () => controller.login(
                              email: emailController.text,
                              password: passController.text),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text("email:test@user.com\npassword:123456"))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
