part of 'create_post_bloc.dart';

sealed class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromGallery extends CreatePostEvent {}

class UploadPostEvent extends CreatePostEvent {
  File? pickedImage;
  String? content;
  UploadPostEvent({this.pickedImage, this.content});
}
