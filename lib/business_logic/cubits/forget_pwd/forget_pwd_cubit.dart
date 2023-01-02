import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../utils/utils.dart';

part 'forget_pwd_state.dart';

class ForgetPwdCubit extends Cubit<ForgetPwdState> {
  final AuthRepository authRepository;

  ForgetPwdCubit({
    required this.authRepository,
  }) : super(ForgetPwdState.initial());

  void forgetPassword({required String email}) async {
    emit(state.copyWith(status: ForgetPwdStatus.loading));

    try {
      await authRepository.forgetPassword(email: email);

      emit(state.copyWith(status: ForgetPwdStatus.success));
    } on GCRError catch (err) {
      emit(state.copyWith(
        status: ForgetPwdStatus.failure,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
