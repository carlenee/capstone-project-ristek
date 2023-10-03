import 'package:capstone_project/core/bases/widgets/molecules/capstone_textfield.dart';
import 'package:capstone_project/core/extensions/text_style_extensions.dart';
import 'package:capstone_project/core/theme/_themes.dart';
import 'package:capstone_project/features/homepage/presentation/bloc/home_page_bloc.dart';
import 'package:capstone_project/features/homepage/presentation/widgets/post_card.dart';
import 'package:capstone_project/features/post_detail/presentation/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_bloc.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_event.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_state.dart';

class PostDetailPage extends StatefulWidget {
  final String? content;
  final String? photo;
  final int likeCount;
  final int dislikeCount;
  final String postId;
  final int userId;
  final HomePageBloc homeBloc;

  const PostDetailPage({
    Key? key,
    this.content,
    this.photo,
    required this.likeCount,
    required this.dislikeCount,
    required this.postId,
    required this.userId, required this.homeBloc,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late TextEditingController _commentController;
  late CommentBloc _commentBloc;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _commentBloc = CommentBloc();
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentBloc>(
      create: (context) => _commentBloc..add(LoadCommentsEvent(widget.postId)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: CapstoneColors.blackPrimary,
          // Add a back button in the leading position
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back when the back button is pressed
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      PostCard(
                        likeCount: widget.likeCount,
                        dislikeCount: widget.dislikeCount,
                        postId: widget.postId,
                        senderId: widget.userId,
                        content: widget.content,
                        photo: widget.photo,
                        bloc: widget.homeBloc,
                        navigate: false,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          "Comment's",
                          style: CapstoneFontTheme.greySecondary.title,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      // BlocBuilder to display comments
                      BlocBuilder<CommentBloc, CommentState>(
                        builder: (context, state) {
                          if (state is CommentLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(CapstoneColors.purple)
                              )
                            );
                          } else if (state is CommentErrorState) {
                            return Text("Error: ${state.error}");
                          } else if (state is CommentLoadedState) {
                            return state.comments.data.isNotEmpty ? ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: state.comments.data.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CommentCard(
                                      commentId: state.comments.data[index].id,
                                      postId: state.comments.data[index].postId,
                                      userId: state.comments.data[index].userId,
                                      content: state.comments.data[index].value,
                                      commentBloc: _commentBloc,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                );
                              },
                            ) : const Text(
                              "There is nothing for now!", 
                              style: CapstoneFontTheme.greySecondary, 
                              textAlign: TextAlign.center);
                          } else if (state is CommentPostedState) {
                            // Reload comments after posting a comment
                            _commentBloc.add(LoadCommentsEvent(widget.postId));
                          } else if (state is CommentEditedState) {
                            _commentBloc.add(LoadCommentsEvent(widget.postId));
                          } else {
                            return const Text("No comments");
                          }
                          return Container(); // You can also use SizedBox() or any other Widget you prefer
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CommentTextField(
                  controller: _commentController,
                  hintText: 'Send a comment',
                  commentBloc: _commentBloc,
                  postId: widget.postId,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
