part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserLoaded extends UserEvent {
  final String userId;

  const UserLoaded({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class UserResetRequested extends UserEvent {}
