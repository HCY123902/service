import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';

@immutable
abstract class SearchState extends Equatable{
  SearchState([List props = const<dynamic>[]]) : super(props);
}

class InitialSearchState extends SearchState {
}

class InitialItemsLoaded extends SearchState {
  final List<CampusService> list;

  InitialItemsLoaded(this.list) : super(list);
}

class ItemsLoaded extends SearchState {
  final List<CampusService> list;

  ItemsLoaded(this.list) : super(list);
}
