import 'package:flutter/foundation.dart';
import 'package:flutter/semantics.dart';

import 'package:flutter/material.dart';

class UserModel {
  //1 creat data types variables
  String? name, addres, mobileno, mailid, country;
  int? age, id;

  //2 create constructor

  UserModel(
      {this.addres,
      this.age,
      this.id,
      this.mobileno,
      this.name,
      this.mailid,
      this.country});

  //3 create from json method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        addres: json["address"],
        name: json["name"],
        id: json["id"],
        age: json["age"],
        mobileno: json["mobile_no"],
        mailid: json["mailid"],
        country: json["country"]);
  }

  //4 to json method
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": addres,
      "age": age,
      "mobile_no": mobileno,
      "id": id,
      "mailid": mailid,
      "country": country
    };
  }
}
