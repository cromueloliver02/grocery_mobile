part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AppEvent {
  final String userId;

  const AppStarted({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class AppResetRequested extends AppEvent {}
