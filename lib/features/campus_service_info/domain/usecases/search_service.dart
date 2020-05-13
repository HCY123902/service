import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/domain/repository/repository.dart';

class SearchService {
  Repository repository;
  List<CampusService> list;

  SearchService(this.repository);

  Future<List<CampusService>> call(Param param) async {
    if(list == null) {
      this.list = await repository.getAllService();
    }
    return list.where((service) {
      return service.title.toLowerCase().contains(param.searchKey.toLowerCase());
    }).toList();
  }
}

class Param extends Equatable {
  final String searchKey;

  Param(this.searchKey) : super([searchKey]);
}