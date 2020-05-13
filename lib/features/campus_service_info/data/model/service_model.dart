import 'package:flutter/foundation.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';

class ServiceModel extends CampusService {
  ServiceModel({@required title, description, contactNumber, emailAddress})
      : super(title: title,
      description: List<String>.from(description),
      contactNumber: List<String>.from(contactNumber),
      emailAddress: List<String>.from(emailAddress)
  );

  factory ServiceModel.fromJson(Map<String, dynamic> file) {
    String title = file["title"];
    List<String> content = List<String>.from(file["description"].split("\n"));
    List<String> description = [];
    List<String> contactNumber = [];
    List<String> emailAddress = [];
    for(String s in content) {
      if(isContactNumber(s)) {
        contactNumber.add(s);
      } else if(isEmailAddress(s)) {
        emailAddress.add(s);
      } else {
        description.add(s);
      }
    }
    //print(description);
    //print(contactNumber);
    //print(emailAddress);
    return ServiceModel(title: title, description: description, contactNumber: contactNumber, emailAddress: emailAddress);
  }

  static bool isContactNumber(String s) {
    bool result = true;
    for(int i = 0; i< s.length; i = i + 1) {
      //print("\n" + s[i]);
      //print(s[i].compareTo("-"));
      //print(s[i].compareTo(""));
      //print(s[i].compareTo("0"));
      //print(s[i].compareTo("9"));
      if(s[i].compareTo("-") != 0 && s[i].compareTo(" ") != 0 && (s[i].compareTo("0") < 0 || s[i].compareTo("9") > 0)) {
        result = false;
        break;
      }
    }
    return result;
  }

  static bool isEmailAddress(String s) {
    bool result = false;
    if(s.contains("@") && s.contains("edu")) {
      result = true;
    }
    return result;
  }
}