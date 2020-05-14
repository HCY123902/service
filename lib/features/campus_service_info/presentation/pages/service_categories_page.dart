import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/features/campus_service_info/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:service/features/campus_service_info/presentation/blocs/categories_bloc/categories_event.dart';
import 'package:service/features/campus_service_info/presentation/blocs/categories_bloc/categories_state.dart';
import 'package:service/features/campus_service_info/presentation/widgets/entry.dart';

class ServiceCategoriesPage extends StatelessWidget {
  ServiceCategoriesPage({Key key}) : super(key: key);

  void showSearchPage(BuildContext context) {
    Navigator.of(context).pushNamed("/searchPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Service Info"),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is InitialCategoriesState) {
            BlocProvider.of<CategoriesBloc>(context).add(LoadingCategories());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            List<Entry> entryList = [];
            state.map.forEach((string, serviceList) {
              entryList.add(Entry(string, serviceList));
            });
            return ListView(
              children: entryList,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSearchPage(context),
        tooltip: 'Search for service',
        child: Icon(Icons.search),
      ),
    );
  }
}
