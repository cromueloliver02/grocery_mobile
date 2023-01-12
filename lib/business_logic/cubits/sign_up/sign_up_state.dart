part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final SignupStatus status;
  final GCRError error;

  const SignUpState({
    required this.status,
    required this.error,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      status: SignupStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'SignUpState(status: $status, error: $error)';

  SignUpState copyWith({
    SignupStatus Function()? status,
    GCRError Function()? error,
  }) {
    return SignUpState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
