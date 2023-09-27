part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoadingState extends HomePageState {}

final class HomePageLoadedState extends HomePageState {
  List<PostModel>? posts;
 
  double? scrollPosition;

  HomePageLoadedState(
      {required this.posts,  this.scrollPosition = 0});
  
}
