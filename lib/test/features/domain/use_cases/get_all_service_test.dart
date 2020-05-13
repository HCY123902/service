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
import 'package:service/features/campus_service_info/domain/usecases/get_service_in_categories.dart';
import 'package:service/features/campus_service_info/domain/usecases/search_service.dart';

void main() {

  test(
      "should give a list of campus service model when the map is passed as an argument",
          () async {
            TestWidgetsFlutterBinding.ensureInitialized();
        final localSource = LocalSourceImplementation('assets/test.json');
        final repository = RepositoryImplementation(localSource);
        final GetServiceInCategories getServiceInCategories = GetServiceInCategories(repository);
        final Map<String, List<CampusService>> list = await getServiceInCategories();
        final CampusService a = ServiceModel(
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
        final CampusService b = ServiceModel(
            title: "Matriculation/Change of Programme/LOA/Facilities' Booking",
            description: [],
            contactNumber: [
              "6592 2451",
            ],
            emailAddress: [
              "matric@ntu.edu.sg",
            ]
        );
        final expectedMap = {"Student Services":[a], "Academic Services":[b]};
        print(list["Academic Services"][0].title);
        print(list["Academic Services"][0].description);
        print(list["Academic Services"][0].contactNumber);
        print(list["Academic Services"][0].emailAddress);
        //print(list);

        expect(list, expectedMap);
      }
  );
}