import 'package:equatable/equatable.dart';

abstract class GenericState<T> extends Equatable {
  const GenericState();

  @override
  List<Object> get props => [];
}

class InitialState<T> extends GenericState<T> {}

class LoadingState<T> extends GenericState<T> {}

class SuccessState<T> extends GenericState<T> {
  final Type model;

  const SuccessState({required this.model});
}

class ErrorState<T> extends GenericState<T> {
  final String error;

  const ErrorState({required this.error});
}
