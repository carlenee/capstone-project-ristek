part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoadingState extends HomePageState {}

final class HomePageLoadedState extends HomePageState {
  final List<PostModel>? posts;

  final double? scrollPosition;

  const HomePageLoadedState({required this.posts, this.scrollPosition = 0});
}

final class HomepageFailureState extends HomePageState {
  final String? message;

  const HomepageFailureState({this.message});
}
