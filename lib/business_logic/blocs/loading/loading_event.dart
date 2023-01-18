part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class LoadingStarted extends LoadingEvent {
  final String userId;

  const LoadingStarted({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}

class LoadingResetRequested extends LoadingEvent {}
