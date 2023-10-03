import 'package:capstone_project/app.dart';
import 'package:capstone_project/features/create_post/presentation/pages/edit_post_page.dart';
import 'package:capstone_project/features/homepage/presentation/bloc/home_page_bloc.dart';
import 'package:capstone_project/features/post_detail/presentation/pages/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/theme/_themes.dart';

class PostCard extends StatefulWidget {
  final String? content;
  final String? photo;
  final int likeCount;
  final int dislikeCount;
  final String postId;
  final int senderId;
  final int userId;
  final HomePageBloc bloc;
  final bool navigate;
  const PostCard({
    this.content,
    this.photo,
    this.navigate = true,
    super.key,
    required this.likeCount,
    required this.dislikeCount,
    required this.postId,
    required this.senderId,
    this.userId = 0,
    required this.bloc,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the post detail page when the card is tapped.
        if (widget.navigate) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PostDetailPage(
                content: widget.content,
                photo: widget.photo,
                likeCount: widget.likeCount,
                dislikeCount: widget.dislikeCount,
                postId: widget.postId,
                userId: widget.senderId,
                homeBloc: widget.bloc,
              ),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: CapstoneColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: CapstoneColors.purple,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "user - ${widget.senderId}",
                        style: CapstoneFontTheme.white,
                      ),
                      const Text(
                        "Computer Science 2020",
                        style: CapstoneFontTheme.greySecondary,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Visibility(
                    visible: widget.userId == widget.senderId,
                    child: PopupMenuButton<String>(
                      color: CapstoneColors.greySecondary,
                      onSelected: (String choice) {
                        if (choice == 'Edit') {
                          // _showEditCommentDialog(context, widget.content);
                          nav.push(EditPostPage(postId: widget.postId));
                        } else if (choice == 'Delete') {
                          _showDeletePostDialog(context, widget.postId,
                              widget.bloc);
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return ['Edit', 'Delete'].map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList();
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: CapstoneColors.greySecondary,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.content ?? '',
                style: CapstoneFontTheme.white,
              ),
              const SizedBox(
                height: 20,
              ),
              if (widget.photo != null) ...[
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(widget.photo!),
                ),
              ],
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle liking the post
                      widget.bloc.add(LikePostEvent(
                        postId: widget.postId,
                        type: 'LIKE', // Toggle like/unlike
                      ));
                    },
                    child: const Icon(
                      UniconsLine.thumbs_up,
                      color: CapstoneColors.greySecondary,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.likeCount.toString(),
                    style: CapstoneFontTheme.greySecondary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle disliking the post
                      widget.bloc.add(LikePostEvent(
                        postId: widget.postId,
                        type: 'DISLIKE', // Toggle dislike/undislike
                      ));
                    },
                    child: const Icon(
                      UniconsLine.thumbs_down,
                      color: CapstoneColors.greySecondary,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.dislikeCount.toString(),
                    style: CapstoneFontTheme.greySecondary,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showDeletePostDialog(BuildContext context, String postId,
    HomePageBloc bloc) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Post'),
        content: const Text('Are you sure you want to delete this post?'),
        actions: [
          TextButton(
            onPressed: () {
              // Delete the comment and close the dialog
              bloc.add(DeletePostEvent(postId: postId));

              Navigator.of(context).pop();
            },
            child: const Text('Delete',
                style: TextStyle(color: CapstoneColors.red)),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog without deleting the comment
              Navigator.of(context).pop();
            },
            child: const Text('Cancel',
                style: TextStyle(color: CapstoneColors.purple)),
          ),
        ],
      );
    },
  );
}
