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

class UserUpdated extends UserEvent {
  final User user;

  const UserUpdated({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class UserShipAddressUpdated extends UserEvent {
  final String shipAddress;

  const UserShipAddressUpdated({
    required this.shipAddress,
  });

  @override
  List<Object> get props => [shipAddress];
}
