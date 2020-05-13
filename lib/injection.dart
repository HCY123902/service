import 'package:get_it/get_it.dart';
import 'package:service/features/campus_service_info/data/repository/repository_implementation.dart';
import 'package:service/features/campus_service_info/data/sources/local_source.dart';
import 'package:service/features/campus_service_info/domain/repository/repository.dart';
import 'package:service/features/campus_service_info/domain/usecases/get_service_in_categories.dart';
import 'package:service/features/campus_service_info/domain/usecases/search_service.dart';
import 'package:service/features/campus_service_info/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:service/features/campus_service_info/presentation/blocs/search_service_bloc/bloc.dart';

final sl = GetIt.instance;
void init() {
  sl.registerFactory(() {
    return CategoriesBloc(
      sl()
    );
  });

  sl.registerFactory(() {
    return SearchBloc(
      searchService: sl()
    );
  });

  sl.registerLazySingleton(() => GetServiceInCategories(sl()));

  sl.registerLazySingleton(() => SearchService(sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImplementation(sl()));

  sl.registerLazySingleton<LocalSource>(() => LocalSourceImplementation('assets/data.json'));

}