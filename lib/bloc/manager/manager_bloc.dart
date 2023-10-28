import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  ManagerBloc() : super(ManagerInitial()) {
    on<ManagerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
