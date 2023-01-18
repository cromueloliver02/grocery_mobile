import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit({
    required this.authRepository,
  }) : super(SignInState.initial());

  void signinWithEmail({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: () => SigninStatus.loading));

    try {
      await authRepository.signinWithEmail(
        email: email,
        password: password,
      );

      emit(state.copyWith(status: () => SigninStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => SigninStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }

  void signinWithGoogle() async {
    emit(state.copyWith(status: () => SigninStatus.loading));

    try {
      await authRepository.signinWithGoogle();

      emit(state.copyWith(status: () => SigninStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => SigninStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }
}
