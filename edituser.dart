import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:myapp1/usercontroller.dart';
import 'package:myapp1/usermodel.dart';
import 'package:myapp1/homepage.dart';
import 'package:myapp1/logintextfeild.dart';

class EditUser extends StatelessWidget {
  EditUser({super.key, required this.user});

  UserModel user;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit User"),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.editnametext,
                  type: TextInputType.text,
                  icon: Icons.person,
                  hint: "name",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.editagetext,
                  type: TextInputType.number,
                  icon: Icons.assignment,
                  hint: "age",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.editaddresstext,
                  type: TextInputType.text,
                  icon: Icons.home,
                  hint: "address",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.editmobiletext,
                  type: TextInputType.number,
                  icon: Icons.call,
                  hint: "number",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.mailidtext,
                  type: TextInputType.text,
                  icon: Icons.mail,
                  hint: "email",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.countrytext,
                  type: TextInputType.text,
                  icon: Icons.circle_rounded,
                  hint: "country",
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () async {
                    controller.updateUser(user.id!);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    child: const Text("Update user"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
