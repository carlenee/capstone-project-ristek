
import 'package:capstone_project/core/theme/_themes.dart';
import 'package:capstone_project/features/create_post/presentation/bloc/bloc/create_post_bloc.dart';
import 'package:capstone_project/features/create_post/presentation/widgets/_widgets.dart';
import 'package:capstone_project/services/di.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EditPostPage extends StatefulWidget {
  final String? imageUrl;
  final String? content;
  final String postId;
  const EditPostPage(
      {this.imageUrl, this.content, required this.postId, super.key});

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final TextEditingController _textContentController = TextEditingController();
  late final CreatePostBloc _bloc;

  @override
  void initState() {
    _bloc = get<CreatePostBloc>();
    _textContentController.text = widget.content ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _textContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CreatePostAppBar(
          context: context,
          bloc: _bloc,
          textController: _textContentController,
          isEdit: true,
          postId: widget.postId,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: BlocBuilder<CreatePostBloc, CreatePostState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is CreatePostLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: CapstoneColors.purple,
                    ),
                  );
                }

                if (state is CreatePostError) {
                  return Center(
                      child: Text(
                    state.message!,
                    style: CapstoneFontTheme.greySecondaryMedium,
                  ));
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    BlocBuilder<CreatePostBloc, CreatePostState>(
                      bloc: _bloc,
                      builder: (context, state) {
                        if (state is CreatePostLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: CapstoneColors.purple,
                            ),
                          );
                        }

                        if (state is CreatePostLoaded) {
                          if (state.pickedImage != null) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 3 / 4,
                              height: 200,
                              child: Image.file(
                                state.pickedImage!,
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                          return widget.imageUrl != null
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 3 / 4,
                                  height: 200,
                                  child: Image.network(
                                    widget.imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const SizedBox();
                        }
                        return const SizedBox();
                      },
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    PostTextField(
                        controller: _textContentController,
                        hint: 'Write your messages here'),
                    const SizedBox(
                      height: 48,
                    ),
                    AddPhotoButton(
                      text: 'Add a photo',
                      onPressed: () {
                        OptionBottomSheet.showObjectBotttomSheet(
                            context: context, bloc: _bloc);
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
