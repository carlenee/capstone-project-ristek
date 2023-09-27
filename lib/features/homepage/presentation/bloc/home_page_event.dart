part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomePageLoadDataEvent extends HomePageEvent {
  PagingController pagingController;
  int pageKey;
  HomePageLoadDataEvent({required this.pagingController, required this.pageKey});

  @override
  List<Object> get props => [pagingController, pageKey];
}
