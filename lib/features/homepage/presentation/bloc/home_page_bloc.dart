import 'package:bloc/bloc.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:capstone_project/features/homepage/domain/usecase/get_list_of_post_use_case.dart';
import 'package:capstone_project/features/homepage/presentation/pages/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

@injectable
@singleton
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  GetListOfPostUseCase _getListOfPostUseCase;
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

      print("tes 1");
      if (listOfPost!.length < size) {
        print("tes 2");
        event.pagingController.appendLastPage(listOfPost);
      } else {
         print("tes 3");
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
