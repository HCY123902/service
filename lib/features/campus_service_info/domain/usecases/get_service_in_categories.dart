import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/domain/repository/repository.dart';

class GetServiceInCategories {
  Repository repository;

  GetServiceInCategories(this.repository);

  Future<Map<String, List<CampusService>>> call() async {
    return await repository.getAllServiceInCategories();
  }
}
