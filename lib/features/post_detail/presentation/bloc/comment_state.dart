import 'package:capstone_project/core/errors/failure.dart';
import 'package:capstone_project/features/post_detail/data/models/comment_model.dart';

abstract class CommentState {}

class CommentInitialState extends CommentState {}

class CommentLoadingState extends CommentState {}

class CommentLoadedState extends CommentState {
  final CommentListModel comments;
  CommentLoadedState(this.comments);
}

class CommentSuccessState extends CommentState {
  final CommentModel comment;
  CommentSuccessState(this.comment);
}

class CommentDeletedState extends CommentState {}

class CommentPostedState extends CommentState {}

class CommentEditedState extends CommentState {}

class CommentErrorState extends CommentState {
  final String error;
  CommentErrorState(this.error);
}
