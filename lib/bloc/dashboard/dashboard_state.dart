part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardSuccessState extends DashboardState {
  final Map<String, dynamic> dashboard;

  DashboardSuccessState({required this.dashboard});
}

class DashboardFailureState extends DashboardState {
  final String message;

  DashboardFailureState({this.message = apiErrorMessage});
}
