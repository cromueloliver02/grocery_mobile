part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserStarted extends UserEvent {
  final String id;

  const UserStarted({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
