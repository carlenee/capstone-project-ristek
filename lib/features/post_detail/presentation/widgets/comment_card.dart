import 'package:capstone_project/core/extensions/text_style_extensions.dart';
import 'package:capstone_project/features/post_detail/data/models/comment_model.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_bloc.dart';
import 'package:capstone_project/features/post_detail/presentation/bloc/comment_event.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/_themes.dart';

class CommentCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                  CircleAvatar(
                    backgroundColor: CapstoneColors.purple,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User $userId",
                        style: CapstoneFontTheme.white.bodyBold,
                      ),
                      Text(
                        "Computer Science",
                        style: CapstoneFontTheme.greySecondary,
                      ),
                    ],
                  ),
                  Spacer(),
                  PopupMenuButton<String>(
                    onSelected: (String choice) {
                      if (choice == 'Edit') {
                        _showEditCommentDialog(context, content);
                      } else if (choice == 'Delete') {
                        _showDeleteCommentDialog(context, content);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return ['Edit', 'Delete'].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                content,
                style: CapstoneFontTheme.white,
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

  // Function to show an edit comment dialog
  void _showEditCommentDialog(BuildContext context, String comment) {
    String value = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Comment'),
          content: TextFormField(
            initialValue: content,
            onChanged: (newValue) {
              // Update the comment content as the user types
              value = newValue;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Save the edited comment and close the dialog
                commentBloc.add(
                  EditCommentEvent(commentId, value, postId),
                );
                commentBloc.add(LoadCommentsEvent(postId));
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without saving changes
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to show a delete comment dialog
  void _showDeleteCommentDialog(BuildContext context, String comment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Comment'),
          content: Text('Are you sure you want to delete this comment?'),
          actions: [
            TextButton(
              onPressed: () {
                // Delete the comment and close the dialog
                commentBloc.add(
                  DeleteCommentEvent(commentId),
                );
                commentBloc.add(LoadCommentsEvent(postId));

                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without deleting the comment
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
