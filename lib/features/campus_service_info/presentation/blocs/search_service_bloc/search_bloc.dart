import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/domain/usecases/search_service_use_cases.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchServiceUseCases searchServiceUseCases;

  SearchBloc({@required SearchServiceUseCases searchServiceUseCases})
      : assert (searchServiceUseCases != null),
        this.searchServiceUseCases = searchServiceUseCases;

  @override
  SearchState get initialState => InitialSearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    // TODO: Add Logic
    if(event is SearchForService) {
      List<CampusService> listOfService = await searchServiceUseCases.searchService(Param(event.searchKey));
      yield ItemsLoaded(listOfService);
    } else if(event is ClearTheSearchContent){
      List<CampusService> listOfService = await searchServiceUseCases.searchService(Param(""));
      yield InitialItemsLoaded(listOfService);
    } else if (event is LoadInitialItems) {
      List<CampusService> listOfService = await searchServiceUseCases.searchService(Param(""));
      yield InitialItemsLoaded(listOfService);
    }
  }
}
