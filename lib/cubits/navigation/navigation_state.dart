part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final int currentIndex;

  const NavigationState({
    required this.currentIndex,
  });

  factory NavigationState.initial() {
    return const NavigationState(currentIndex: 0);
  }

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'NavigationState(currentIndex: $currentIndex)';

  NavigationState copyWith({
    int? currentIndex,
  }) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
