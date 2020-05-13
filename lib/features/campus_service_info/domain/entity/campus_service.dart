import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CampusService extends Equatable {
  final String title;
  final List<String> description;
  final List<String> contactNumber;
  final List<String> emailAddress;

  CampusService({
    @required this.title,
    this.contactNumber,
    this.description,
    this.emailAddress}) : super([title, description, contactNumber, emailAddress]);
}