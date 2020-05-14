import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:service/features/campus_service_info/presentation/widgets/entry_item.dart';

class Entry extends StatelessWidget {
  final String title;
  final List<CampusService> list;

  Entry(this.title, this.list);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(
      title: Text("${title}"),
      children: list.map((service) {
        return EntryItem(service);
      }).toList(),
    );
  }
}

