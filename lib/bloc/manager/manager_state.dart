part of 'manager_bloc.dart';

@immutable
sealed class ManagerState {}

final class ManagerInitialState extends ManagerState {}

final class ManagerLoadingState extends ManagerState {}

final class ManagerSucessState extends ManagerState {}

final class ManagerFailureState extends ManagerState {}
