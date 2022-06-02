import 'package:equatable/equatable.dart';

abstract class CardBacksEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CardBacksFetched extends CardBacksEvent {}
