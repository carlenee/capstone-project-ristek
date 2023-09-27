part of 'create_post_bloc.dart';

sealed class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

final class CreatePostInitial extends CreatePostState {}

final class CreatePostLoading extends CreatePostState {}

final class CreatePostLoaded extends CreatePostState {
  File? pickedImage;

  CreatePostLoaded({this.pickedImage});
}

final class CreatePostSuccess extends CreatePostState {}

final class CreatePostError extends CreatePostState {
  String? message;
  CreatePostError({this.message});
}
