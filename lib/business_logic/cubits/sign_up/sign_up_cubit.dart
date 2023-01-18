import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

  SignUpCubit({
    required this.authRepository,
  }) : super(SignUpState.initial());

  void signupWithEmail({
    required String name,
    required String email,
    required String password,
    required String shipAddress,
  }) async {
    emit(state.copyWith(status: () => SignupStatus.loading));

    try {
      await authRepository.signupWithEmail(
        name: name,
        email: email,
        password: password,
        shipAddress: shipAddress,
      );

      emit(state.copyWith(status: () => SignupStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: () => SignupStatus.failure,
        error: () => err,
      ));

      logError(state, err);
    }
  }
}
