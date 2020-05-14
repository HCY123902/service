import 'package:equatable/equatable.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/domain/repository/repository.dart';

class SearchServiceUseCases {
  Repository repository;

  SearchServiceUseCases(this.repository);

  Future<Map<String, List<CampusService>>> getServiceInCategories() async {
    Map<String, List<CampusService>> map = await repository.getAllServiceInCategories();
    return map;
  }

  Future<List<CampusService>> searchService(Param param) async {
    List<CampusService> list = await repository.getAllService();
    return list.where((service) {
      return service.title.toLowerCase().contains(param.searchKey.toLowerCase());
    }).toList();
  }
}

class Param extends Equatable {
  final String searchKey;

  Param(this.searchKey) : super([searchKey]);
}