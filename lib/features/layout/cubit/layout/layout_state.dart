part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class AppLogoutLoadingState extends LayoutState {}
class AppLogoutSuccessState extends LayoutState {}

class AppChangeButtonNavBarStates extends LayoutState {}
