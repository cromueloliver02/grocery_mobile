part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserLoaded extends UserEvent {
  final User user;

  const UserLoaded({
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
