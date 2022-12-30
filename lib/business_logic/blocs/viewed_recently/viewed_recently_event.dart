part of 'viewed_recently_bloc.dart';

abstract class ViewedRecentlyEvent extends Equatable {
  const ViewedRecentlyEvent();

  @override
  List<Object> get props => [];
}

class ViewedRecentlyStarted extends ViewedRecentlyEvent {}
