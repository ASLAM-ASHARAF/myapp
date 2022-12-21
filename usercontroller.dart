import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp1/usermodel.dart';
import 'package:http/http.dart' as http;
//post methode

class UserController extends GetxController {
  String baseurl = "https://dummyjson.com/users";
  //1 create instance
  var users = <UserModel>[].obs;
  TextEditingController nametext = TextEditingController();
  TextEditingController agetext = TextEditingController();
  TextEditingController addresstext = TextEditingController();
  TextEditingController mobiletext = TextEditingController();
  TextEditingController mailidtext = TextEditingController();
  TextEditingController countrytext = TextEditingController();

  TextEditingController editnametext = TextEditingController();
  TextEditingController editaddresstext = TextEditingController();
  TextEditingController editagetext = TextEditingController();
  TextEditingController editmobiletext = TextEditingController();
  TextEditingController editmailidtext = TextEditingController();
  TextEditingController editcountrytext = TextEditingController();
  //2 create method
  addUser() async {
    Uri url = Uri.parse("${baseurl}addUser");

    //3 create data or assign data
    final userdata = UserModel(
        name: nametext.text,
        addres: addresstext.text,
        age: int.parse(agetext.text),
        mobileno: mobiletext.text,
        mailid: mailidtext.text,
        country: countrytext.text);
    //4 post data to api
    try {
      var res = await http.post(url,
          body: jsonEncode(userdata.toJson()),
          headers: {"content-type": "application/json"});
      if (res.statusCode == 201) {
        Get.snackbar("post", "Successfully");
        clear();
        await getUser();
      }
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }

//get methode
  getUser() async {
    Uri url = Uri.parse("${baseurl}getuser");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = List<UserModel>.from(
            jsonDecode(res.body).map((e) => UserModel.fromJson(e))).toList();
        if (data != null) {
          users.value = data;
        }
      }
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }

  updateUser(int i) async {
    Uri url = Uri.parse("${baseurl}updateUser");
    final data = UserModel(
        id: i,
        addres: editaddresstext.text,
        mobileno: mobiletext.text,
        age: int.parse(editagetext.text),
        name: editnametext.text,
        mailid: editmailidtext.text,
        country: editcountrytext.text);
    try {
      var res = await http.put(url,
          body: jsonEncode(data.toJson()),
          headers: {"content-type": "application/json"});
      if (res.statusCode == 200) {
        Get.back();
        await getUser();
        Get.snackbar("success", "updated");
      }
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }

  deleteuser(String i) async {
    Uri url = Uri.parse("${baseurl}deleteuser/$i");
    var res = await http.delete(url);
    if (res.statusCode == 200) {
      getUser();
      Get.snackbar("delete", "success");
    }
  }

  clear() {
    agetext.clear();
    addresstext.clear();
    nametext.clear();
    mobiletext.clear();
    mailidtext.clear();
    countrytext.clear();
  }

  void onInit() {
    getUser();
    super.onInit();
  }
}
