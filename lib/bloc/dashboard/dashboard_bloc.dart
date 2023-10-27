//import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

import '../../values/string.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<DashboardEvent>((event, emit) async {
      emit(DashboardLoadingState());

      try {
        final Map<String, dynamic> dashboard = {};
        // await Supabase.instance.client.rpc(
        //   'get_admin_dashboard',
        //   params: {
        //     'search_date': DateFormat('yyyy-MM-dd').format(DateTime.now())
        //   },
        // );
        emit(DashboardSuccessState(dashboard: dashboard));
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(DashboardFailureState(message: e.toString()));
      }
    });
  }
}
