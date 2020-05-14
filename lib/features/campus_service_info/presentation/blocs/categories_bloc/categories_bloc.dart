import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:service/features/campus_service_info/domain/usecases/search_service_use_cases.dart';
import './bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final SearchServiceUseCases searchServiceUseCases;

  CategoriesBloc({@required SearchServiceUseCases searchServiceUseCases})
  : assert(searchServiceUseCases != null),
    this.searchServiceUseCases = searchServiceUseCases;

  @override
  // TODO: implement initialState
  CategoriesState get initialState => InitialCategoriesState();

  @override
  Stream<CategoriesState> mapEventToState(
    CategoriesEvent event,
  ) async* {
    // TODO: Add Logic
    if(event is LoadingCategories) {
      final map = await searchServiceUseCases.getServiceInCategories();
      yield LoadedState(map);
    }
  }
}
