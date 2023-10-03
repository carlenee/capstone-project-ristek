part of 'create_post_bloc.dart';

sealed class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromGallery extends CreatePostEvent {}

class PickImageFromCamera extends CreatePostEvent {}

class UploadPostEvent extends CreatePostEvent {
  final String? pickedImage;
  final String? content;
  const UploadPostEvent({this.pickedImage, this.content});
}

class EditPostEvent extends CreatePostEvent {
  final String? pickedImage;
  final String? content;
  final String postId;
  const EditPostEvent({this.pickedImage, this.content, required this.postId});
}
