import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/not_user.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(
    this._authFacade,
  ) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckedRequested) {
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        final bool? isOnboardingCompleted =
            preferences.getBool("is_onboarding_completed");

        if (isOnboardingCompleted == null || !isOnboardingCompleted) {
          emit(
            const AuthState.initial(),
          );
        } else {
          final Option<NotUser> userOption = _authFacade.getSignedInUser();

          emit(
            userOption.fold(
              () => const AuthState.unauthenticated(),
              (_) => const AuthState.authenticated(),
            ),
          );
        }
      } else if (event is SignedOut) {
        await _authFacade.signOut();
        emit(
          const AuthState.unauthenticated(),
        );
      }
    });
  }
}
