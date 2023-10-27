import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../values/string.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitialState()) {
    on<ResetPasswordEvent>((event, emit) async {
      emit(ResetPasswordLoadingState());
      try {
        SupabaseClient supabaseClient = Supabase.instance.client;

        AuthResponse response = await supabaseClient.auth.verifyOTP(
          email: event.email,
          token: event.otp,
          type: OtpType.recovery,
        );

        await supabaseClient.auth.updateUser(
          UserAttributes(
            password: event.password,
          ),
        );

        if (response.user != null && response.user!.appMetadata['isAdmin']) {
          emit(ResetPasswordSuccessState());
        } else {
          await supabaseClient.auth.signOut();
          emit(
            ResetPasswordFailureState(
              message:
                  'Your password has been reset, but you cannot be logged into this panel!',
            ),
          );
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ResetPasswordFailureState(message: e.toString()));
      }
    });
  }
}
