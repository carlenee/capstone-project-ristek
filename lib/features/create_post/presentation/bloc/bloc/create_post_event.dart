part of 'create_post_bloc.dart';

sealed class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class PickImageFromGallery extends CreatePostEvent {}

class UploadPostEvent extends CreatePostEvent {
  final File? pickedImage;
  final String? content;
  const UploadPostEvent({this.pickedImage, this.content});
}
