import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:service/features/campus_service_info/data/model/service_model.dart';

void main() {
  test(
    "should give a campus service model when the map is passed as an argument",
      () async {
        final campusService = ServiceModel.fromJson(
            ((jsonDecode(File('E:/application/service/lib/information/data.json').readAsStringSync()))["Student Services"])[0]
        );
        final expectedValue = ServiceModel(
            title: "One Stop @ SAC",
            description: [
              "North Spine",
              "Mon - Thurs: 8:30am - 5pm",
              "Fri: 8:30am - 4:45pm",
              "Sat, Sun and PH: Closed",
            ],
            contactNumber: [
              "6790 6823",
              "6592 3626",
            ],
            emailAddress: []
        );
        //print(campusService.title);
        //print(campusService.description);
        //print(campusService.contactNumber);
        //print(campusService.emailAddress);
        expect(campusService, expectedValue);
      }
  );
}