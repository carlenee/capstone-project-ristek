abstract class CommentEvent {}

class LoadCommentsEvent extends CommentEvent {
  final String postId;
  LoadCommentsEvent(this.postId);
}

class EditCommentEvent extends CommentEvent {
  final int commentId;
  final String value;
  final String postId;
  EditCommentEvent(this.commentId, this.value, this.postId);
}

class DeleteCommentEvent extends CommentEvent {
  final int commentId;
  DeleteCommentEvent(this.commentId);
}

class PostCommentEvent extends CommentEvent {
  final String postId;
  final String commentValue;

  PostCommentEvent({
    required this.postId,
    required this.commentValue,
  });
}
