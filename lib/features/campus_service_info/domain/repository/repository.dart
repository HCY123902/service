import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';

abstract class Repository {
  Future<List<CampusService>> getAllService();
  Future<Map<String, List<CampusService>>> getAllServiceInCategories();
}