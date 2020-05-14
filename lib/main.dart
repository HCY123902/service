import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/features/campus_service_info/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:service/features/campus_service_info/presentation/blocs/search_service_bloc/bloc.dart';
import 'package:service/features/campus_service_info/presentation/pages/search_page.dart';
import 'package:service/features/campus_service_info/presentation/pages/service_categories_page.dart';
import 'injection.dart' as inject;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  inject.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesBloc>.value(
            value: inject.sl<CategoriesBloc>(),
          ),
          BlocProvider<SearchBloc>.value(
            //builder: (context) => inject.sl<SearchBloc>(),
            value: inject.sl<SearchBloc>(),
          ),
        ],
        //builder: (context) => inject.sl<CategoriesBloc>(),
        child: MaterialApp(
          title: 'Campus Service Info',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ServiceCategoriesPage(),
          routes: {
            "/searchPage": (buildContext) => SearchPage(),
          },
        ),
    );
  }
}




