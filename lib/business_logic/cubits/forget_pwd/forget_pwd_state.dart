part of 'forget_pwd_cubit.dart';

class ForgetPwdState extends Equatable {
  final ForgetPwdStatus status;
  final GCRError error;

  const ForgetPwdState({
    required this.status,
    required this.error,
  });

  factory ForgetPwdState.initial() {
    return const ForgetPwdState(
      status: ForgetPwdStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'ForgetPwdState(status: $status, error: $error)';

  ForgetPwdState copyWith({
    ForgetPwdStatus Function()? status,
    GCRError Function()? error,
  }) {
    return ForgetPwdState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
