import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent extends Equatable{
  SearchEvent([List props = const<dynamic>[]]) : super(props);
}

class LoadInitialItems extends SearchEvent {
}

class SearchForService extends SearchEvent {
  final String searchKey;

  SearchForService(this.searchKey) : super([searchKey]);
}

class ClearTheSearchContent extends SearchEvent {
}
