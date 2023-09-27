
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:capstone_project/features/homepage/domain/usecase/get_list_of_post_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

@injectable
@singleton
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetListOfPostUseCase _getListOfPostUseCase;
  int size = 3;

  HomePageBloc(this._getListOfPostUseCase) : super(HomePageInitial()) {
    on<HomePageLoadDataEvent>(_loadPost);
  }

  void _loadPost(
    HomePageLoadDataEvent event,
    Emitter<HomePageState> emit,
  ) async {
    try {
      var listOfPost =
          await _getListOfPostUseCase.execute(size: size, page: event.pageKey);

      if (listOfPost!.length < size) {
        event.pagingController.appendLastPage(listOfPost);
      } else {
        event.pagingController.appendPage(listOfPost, event.pageKey + 1);
      }

      emit(
        HomePageLoadedState(
          posts: listOfPost,
        ),
      );
    } catch (e) {
      event.pagingController.error = e.toString();
    }
  }
}
