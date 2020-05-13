import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service/features/campus_service_info/domain/entity/campus_service.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class EntryItem extends StatelessWidget {
  final CampusService service;

  EntryItem(this.service);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      title: Text(service.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          !service.description.isEmpty
              ? SelectableText(
                  service.description.reduce((a, b) => a + "\n" + b),
                  showCursor: true,
                )
              : Container(),
          !service.contactNumber.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: service.contactNumber.map((number) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SelectableText(
                          number,
                          onTap: () {
                            UrlLauncher.launch("tel://${number}");
                          },
                          showCursor: true,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        RaisedButton(
                          child: Text("copy"),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: number));
                          },
                        )
                      ],
                    );
                  }).toList(),
                )
              : Container(),
          !service.emailAddress.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: service.emailAddress.map((address) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SelectableText(
                          address,
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: address));
                          },
                          showCursor: true,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        RaisedButton(
                          child: Text("copy"),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: address));
                          },
                        ),
                      ],
                    );
                  }).toList(),
                )
              : Container(),
        ],
      ),
    );
    ;
  }
}
