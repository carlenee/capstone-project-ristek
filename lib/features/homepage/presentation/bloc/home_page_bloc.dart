import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:capstone_project/features/homepage/data/repositories/home_page_repository_impl.dart';
import 'package:capstone_project/features/homepage/domain/usecase/delete_post_usecase.dart';
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
  final DeletePostUseCase _deletePostUseCase;
  int size = 3;

  HomePageBloc(this._getListOfPostUseCase, this._deletePostUseCase)
      : super(HomePageInitial()) {
    on<HomePageLoadDataEvent>(_loadPost);
    on<LikePostEvent>(_likePost);
    on<DeletePostEvent>(_deletePost);
  }

  void _loadPost(
    HomePageLoadDataEvent event,
    Emitter<HomePageState> emit,
  ) async {
    var res =
        await _getListOfPostUseCase.execute(size: size, page: event.pageKey);

    res.fold((fail) {
      emit(HomepageFailureState(
          message: fail.message ?? "Something went wrong."));
    }, (data) {
      if (data!.length < size) {
        event.pagingController.appendLastPage(data);
      } else {
        event.pagingController.appendPage(data, event.pageKey + 1);
      }

      emit(
        HomePageLoadedState(
          posts: data,
        ),
      );
    });
  }

  Future<void> _likePost(
    LikePostEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(HomePageLoadingState());

    try {
      await HomePageRepositoryImpl.likePost(event.postId, event.type);
      emit(HomePageSuccessState());
    } catch (error) {
      emit(const HomepageFailureState());
    }
  }

  void _deletePost(
    DeletePostEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(HomePageLoadingState());
    final resp = await _deletePostUseCase.execute(event.postId);
    resp.fold((fail) {
      emit(HomepageFailureState(
          message: fail.message ?? "Something went wrong."));
    }, (data) {
      emit(HomePageSuccessState());
    });
  }
}
