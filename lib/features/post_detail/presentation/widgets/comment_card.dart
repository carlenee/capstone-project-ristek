import 'package:capstone_project/core/bases/widgets/atoms/text_field.dart';
import 'package:capstone_project/core/extensions/text_style_extensions.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_bloc.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_event.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/_themes.dart';

class CommentCard extends StatefulWidget {
  final int commentId;
  final String content;
  final String postId;
  final int userId;
  final CommentBloc commentBloc;

  const CommentCard({
    required this.content,
    super.key,
    required this.postId,
    required this.userId,
    required this.commentBloc,
    required this.commentId,
  });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  final TextEditingController _commentController = TextEditingController();
  bool _editMode = false;
  
  @override
  Widget build(BuildContext context) {
    _commentController.text = widget.content;
    return GestureDetector(
      onTap: () {
        // Navigate to the post detail page when the card is tapped.
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
                        "User ${widget.userId}",
                        style: CapstoneFontTheme.white.bodyBold,
                      ),
                      const Text(
                        "Computer Science",
                        style: CapstoneFontTheme.greySecondary,
                      ),
                    ],
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    color: CapstoneColors.greySecondary,
                    onSelected: (String choice) {
                      if (choice == 'Edit') {
                        // _showEditCommentDialog(context, widget.content);
                        setState(() {
                          _editMode = true;
                        });
                      } else if (choice == 'Delete') {
                        _showDeleteCommentDialog(context, widget.content);
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              !_editMode ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                width: double.infinity,
                child: Text(
                  widget.content,
                  textAlign: TextAlign.left,
                  style: CapstoneFontTheme.white,
                ),
              ) : Stack(
                children: [
                  CTextField(
                    title: 'Edit comment', 
                    hint: 'Type here...', 
                    controller: _commentController,
                    infiniteLines: true,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: const EdgeInsets.all(20),
                      icon: const Icon(
                        Icons.check, 
                        color: CapstoneColors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          // Save the edited comment and close the dialog
                          widget.commentBloc.add(
                            EditCommentEvent(widget.commentId, _commentController.text, widget.postId),
                          );
                          widget.commentBloc.add(LoadCommentsEvent(widget.postId));
                          _editMode = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show a delete comment dialog
  void _showDeleteCommentDialog(BuildContext context, String comment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Comment'),
          content: const Text('Are you sure you want to delete this comment?'),
          actions: [
            TextButton(
              onPressed: () {
                // Delete the comment and close the dialog
                widget.commentBloc.add(
                  DeleteCommentEvent(widget.commentId),
                );
                widget.commentBloc.add(LoadCommentsEvent(widget.postId));

                Navigator.of(context).pop();
              },
              child: const Text('Delete', style: TextStyle(color: CapstoneColors.red)),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without deleting the comment
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: CapstoneColors.purple)),
            ),
          ],
        );
      },
    );
  }
}
