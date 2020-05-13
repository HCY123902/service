import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';

@immutable
abstract class CategoriesState extends Equatable{
  CategoriesState([List props = const<dynamic>[]]) : super(props);
}

class InitialCategoriesState extends CategoriesState {
}

class LoadedState extends CategoriesState {
  final Map<String, List<CampusService>> map;

  LoadedState(this.map) : super([map]);
}
