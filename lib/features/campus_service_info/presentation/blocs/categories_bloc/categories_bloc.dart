import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/domain/usecases/get_service_in_categories.dart';
import 'package:service/features/campus_service_info/presentation/blocs/search_service_bloc/bloc.dart';
import './bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetServiceInCategories getServiceInCategories;

  CategoriesBloc(this.getServiceInCategories);

  @override
  // TODO: implement initialState
  CategoriesState get initialState => InitialCategoriesState();

  @override
  Stream<CategoriesState> mapEventToState(
    CategoriesEvent event,
  ) async* {
    // TODO: Add Logic
    if(event is LoadingCategories) {
      final map = await getServiceInCategories();
      yield LoadedState(map);
    }
  }
}
