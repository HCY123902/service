import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:service/features/campus_service_info/data/model/service_model.dart';
import 'package:service/features/campus_service_info/data/repository/repository_implementation.dart';
import 'package:service/features/campus_service_info/data/sources/local_source.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';

void main() {

  test(
      "should give a list of campus service model when the map is passed as an argument",
          () async {
            TestWidgetsFlutterBinding.ensureInitialized();
        final localSource = LocalSourceImplementation('assets/test.json');
        final repository = RepositoryImplementation(localSource);
        final List<CampusService> list = await repository.getAllService();
        final a = ServiceModel(
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
        final b = ServiceModel(
            title: "Matriculation/Change of Programme/LOA/Facilities' Booking",
            description: [],
            contactNumber: [
              "6592 2451",
            ],
            emailAddress: [
              "matric@ntu.edu.sg",
            ]
        );
        //print(campusService.title);
        //print(campusService.description);
        //print(campusService.contactNumber);
        //print(campusService.emailAddress);
        //print(list);

        expect(list, [a, b]);
      }
  );
}