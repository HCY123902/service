import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoriesEvent extends Equatable {}

class LoadingCategories extends CategoriesEvent {
}
