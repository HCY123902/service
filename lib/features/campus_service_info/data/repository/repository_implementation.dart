import 'package:service/features/campus_service_info/data/model/service_model.dart';
import 'package:service/features/campus_service_info/data/sources/local_source.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/domain/repository/repository.dart';

class RepositoryImplementation implements Repository {
  final LocalSource localSource;

  RepositoryImplementation(this.localSource);

  Future<List<CampusService>> getAllService() async {
    Map<String, List<CampusService>> map = await localSource.getService();
    List<CampusService> result = [];
    map.forEach((key, list) {
      for(CampusService a in list) {
        result.add(a);
      }
    });
    return result;
  }

  Future<Map<String, List<CampusService>>> getAllServiceInCategories() async {
    return await localSource.getService();
  }
}