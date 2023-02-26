part of 'check_box_cubit.dart';

@immutable
abstract class CheckboxCartState {}

class CheckboxCartInitial extends CheckboxCartState {}

class CheckboxCartIsChecked extends CheckboxCartState {
  final List<ProductModel> model;

  CheckboxCartIsChecked(this.model);
}
