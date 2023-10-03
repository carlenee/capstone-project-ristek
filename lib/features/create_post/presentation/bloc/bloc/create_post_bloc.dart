import 'dart:io';

import 'package:capstone_project/features/create_post/data/models/upload_post_model.dart';
import 'package:capstone_project/features/create_post/domain/usecase/edit_post_use_case.dart';
import 'package:capstone_project/features/create_post/domain/usecase/upload_post_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

@injectable
@singleton
class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final UploadPostUseCase _uploadPostUseCase;
  final EditPostUseCase _editPostUseCase;

  CreatePostBloc(this._uploadPostUseCase, this._editPostUseCase)
      : super(CreatePostInitial()) {
    on<PickImageFromGallery>(_pickImage);
    on<UploadPostEvent>(_postContent);
    on<EditPostEvent>(_postEdit);
    on<PickImageFromCamera>(_takeImage);
  }

  void _pickImage(
    PickImageFromGallery event,
    Emitter<CreatePostState> emit,
  ) async {
    try {
      if (state is CreatePostInitial) {
        final pickedImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        emit(CreatePostLoading());

        if (pickedImage != null) {
          emit(
            CreatePostLoaded(
              pickedImage: File(pickedImage.path),
            ),
          );
        } else {
          emit(
            const CreatePostError(
                message: "There's an error while getting the image"),
          );
        }
      }
    } catch (e) {
      emit(
        CreatePostError(
          message: e.toString(),
        ),
      );
    }
  }

  void _takeImage(
      PickImageFromCamera event, Emitter<CreatePostState> emit) async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      emit(CreatePostLoading());

      if (pickedImage != null) {
        emit(CreatePostLoaded(pickedImage: File(pickedImage.path)));
      } else {
        emit(const CreatePostError(
            message: "There's an error while getting the image"));
      }
    } catch (e) {
      emit(CreatePostError(message: e.toString()));
    }
  }

  void _postContent(
    UploadPostEvent event,
    Emitter<CreatePostState> emit,
  ) async {
    try {
      emit(CreatePostLoading());
      final resp = await _uploadPostUseCase.execute(UploadPostModel(
          title: 'title',
          content: event.content == '' ? 'No Caption' : event.content!,
          picture: event.pickedImage ?? ''));

      if (resp == true) {
        emit(CreatePostSuccess());
      } else {
        emit(
          const CreatePostError(message: "Error while uploading post"),
        );
      }
    } catch (e) {
      emit(CreatePostError(message: e.toString()));
    }
  }

  void _postEdit(EditPostEvent event, Emitter<CreatePostState> emit) async {
    emit(CreatePostLoading());
    final resp = await _editPostUseCase.execute(UploadPostModel(
        title: 'title',
        content: event.content ?? 'No caption',
        picture: event.pickedImage ?? '',
        id: event.postId));
    if (resp == true) {
      emit(CreatePostSuccess());
    } else {
      emit(
        const CreatePostError(message: "Error while uploading post"),
      );
    }
  }

  
}
