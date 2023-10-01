import 'package:capstone_project/features/post_detail/data/repository/comment_repository.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_event.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitialState()) {
    on<LoadCommentsEvent>(_getComment);
    on<EditCommentEvent>(_editComment);
    on<DeleteCommentEvent>(_deleteComment);
    on<PostCommentEvent>(_postComment);
  }

  Future<void> _getComment(
    LoadCommentsEvent event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoadingState());

    final result = await CommentRepository.getComments(event.postId);

    result.fold(
      (failure) {
        emit(CommentErrorState(failure.message));
      },
      (comment) {
        emit(CommentLoadedState(comment));
      },
    );
  }

  Future<void> _editComment(
    EditCommentEvent event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoadingState());
    print(
        'Received EditCommentEvent with ID: ${event.commentId}, New value: ${event.value}, Post ID: ${event.postId}');

    try {
      await CommentRepository.editComment(
          event.commentId, event.value, event.postId);
      print('Successfully edited comment: ${event.commentId}');
      emit(CommentEditedState());
    } catch (error) {
      print('Failed to edit comment: ');

      emit(CommentErrorState(error.toString()));
    }
  }

  Future<void> _deleteComment(
    DeleteCommentEvent event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoadingState());

    try {
      await CommentRepository.deleteComment(event.commentId);
      emit(CommentEditedState());
    } catch (error) {
      emit(CommentErrorState('Error deleting comment: $error'));
    }
  }
}

Future<void> _postComment(
  PostCommentEvent event,
  Emitter<CommentState> emit,
) async {
  emit(CommentLoadingState());

  try {
    await CommentRepository.postComment(event.postId, event.commentValue);
    emit(CommentPostedState()); // Emit a success state
  } catch (error) {
    emit(CommentErrorState(error.toString()));
  }
}
