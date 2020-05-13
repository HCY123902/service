import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/domain/usecases/get_service_in_categories.dart';
import 'package:service/features/campus_service_info/domain/usecases/search_service.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchService searchService;

  SearchBloc({@required SearchService searchService})
      : assert (searchService != null),
        this.searchService = searchService;

  @override
  SearchState get initialState => InitialSearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    // TODO: Add Logic
    if(event is SearchForService) {
      List<CampusService> listOfService = await searchService(Param(event.searchKey));
      yield ItemsLoaded(listOfService);
    } else if(event is ClearTheSearchContent){
      List<CampusService> listOfService = await searchService(Param(""));
      yield InitialItemsLoaded(listOfService);
    } else if (event is LoadInitialItems) {
      List<CampusService> listOfService = await searchService(Param(""));
      yield InitialItemsLoaded(listOfService);
    }
  }
}
