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
    SigninStatus? status,
    GCRError? error,
  }) {
    return SignInState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
