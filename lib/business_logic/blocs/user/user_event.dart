part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserStarted extends UserEvent {
  final String userId;

  const UserStarted({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class UserShipAddressUpdated extends UserEvent {
  final String shipAddress;

  const UserShipAddressUpdated({
    required this.shipAddress,
  });

  @override
  List<Object> get props => [shipAddress];
}
