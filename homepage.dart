import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp1/logintextfeild.dart';
import 'package:myapp1/usercontroller.dart';
import 'package:myapp1/edituser.dart';
import 'package:myapp1/usermodel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Task App"),
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
                  ctrl: controller.nametext,
                  type: TextInputType.text,
                  icon: Icons.person,
                  hint: "name",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.agetext,
                  type: TextInputType.number,
                  icon: Icons.assignment,
                  hint: "age",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.addresstext,
                  type: TextInputType.text,
                  icon: Icons.home,
                  hint: "address",
                ),
                const SizedBox(
                  height: 12,
                ),
                logintextfeild(
                  ctrl: controller.mobiletext,
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
                    await controller.addUser();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    child: const Text("add user"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      height: 10,
                    ),
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return ListTile(
                    onTap: () async {
                      controller.editaddresstext.text = user.addres!;
                      controller.editagetext.text = user.age.toString();
                      controller.editmobiletext.text = user.mobileno!;
                      controller.editnametext.text = user.name!;
                      controller.editmailidtext.text = user.mailid!;
                      controller.editcountrytext.text = user.country!;
                      Get.to(() => EditUser(
                            user: user,
                          ));
                    },
                    tileColor: Colors.white,
                    leading: const CircleAvatar(),
                    subtitle: Text(user.age.toString()),
                    title: Text(user.name!),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        controller.deleteuser(user.id.toString());
                      },
                    ),
                  );
                });
          }))
        ],
      ),
    );
  }
}
