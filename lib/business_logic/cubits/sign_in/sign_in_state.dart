part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final SigninStatus status;
  final GCRError error;

  const SignInState({
    required this.status,
    required this.error,
  });

  factory SignInState.initial() {
    return const SignInState(
      status: SigninStatus.initial,
      error: GCRError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'SignInState(status: $status, error: $error)';

  SignInState copyWith({
    SigninStatus Function()? status,
    GCRError Function()? error,
  }) {
    return SignInState(
      status: status != null ? status() : this.status,
      error: error != null ? error() : this.error,
    );
  }
}
