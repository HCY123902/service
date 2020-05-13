import 'dart:convert';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:service/features/campus_service_info/data/model/service_model.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';

abstract class LocalSource {
  Future<Map<String, dynamic>> getService();
}

class LocalSourceImplementation implements LocalSource {
  final String path;

  LocalSourceImplementation(this.path);

  @override
  Future<Map<String, List<ServiceModel>>> getService() async {
    // TODO: implement getService
    try {
      Map<String, dynamic> map = jsonDecode(await rootBundle.loadString(path));
      Map<String, List<ServiceModel>> result = {};
      map.forEach((key, list) {
        List<ServiceModel> serviceList = (map[key] as List).map((a) =>
            ServiceModel.fromJson(a as Map<String, dynamic>)).toList();
        //result.putIfAbsent(key, () => serviceList);
        result[key] = serviceList;
      });
      return Future.value(result);
    } on FileSystemException {
      return Future.value({"hello":[ServiceModel(title: "hello",)]});
    }
  }
}