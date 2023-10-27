import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../values/string.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEvent>((event, emit) async {
      emit(SignInLoadingState());
      try {
        AuthResponse response =
            await Supabase.instance.client.auth.signInWithPassword(
          email: event.email,
          password: event.password,
        );

        if (response.user != null &&
            response.user!.appMetadata['user_type'] == 'admin') {
          emit(SignInSuccessState());
        } else {
          emit(SignInFailureState(message: 'Unauthorized!'));
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        if (e is AuthException) {
          emit(SignInFailureState(message: e.message.toString()));
        } else {
          emit(SignInFailureState(message: e.toString()));
        }
      }
    });
  }
}
