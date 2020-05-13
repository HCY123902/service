import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service/features/campus_service_info/presentation/blocs/categories_bloc/categories_event.dart';
import 'package:service/features/campus_service_info/presentation/blocs/search_service_bloc/bloc.dart';
import 'package:service/features/campus_service_info/presentation/widgets/entry_item.dart';
import 'package:service/injection.dart' as inject;

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void dispatchClearEvent() {
      textController.clear();
      BlocProvider.of<SearchBloc>(context).dispatch(ClearTheSearchContent());
    }

    void dispatchSearchEvent(String searchKey) {
      BlocProvider.of<SearchBloc>(context).dispatch(SearchForService(searchKey));
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              dispatchClearEvent();
              Navigator.of(context).pop();
            },
          ),
          title: TextField(
            controller: textController,
            onChanged: dispatchSearchEvent,
            onSubmitted: dispatchSearchEvent,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: dispatchClearEvent,
            )
          ],
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if(state is InitialSearchState) {
              final searchBloc = BlocProvider.of<SearchBloc>(context);
              searchBloc.dispatch(LoadInitialItems());
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if(state is InitialItemsLoaded) {
              return ListView(
                children: state.list.map((service) {
                  return EntryItem(service);
                }).toList(),
              );
            } else if(state is ItemsLoaded) {
              return ListView(
                children: state.list.map((service) {
                  return EntryItem(service);
                }).toList(),
              );
            }
          },
        ),
      );
  }
}