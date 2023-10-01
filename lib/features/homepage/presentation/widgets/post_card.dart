import 'package:capstone_project/core/extensions/text_style_extensions.dart';
import 'package:capstone_project/features/homepage/presentation/bloc/home_page_bloc.dart';
import 'package:capstone_project/features/post_detail/presentation/pages/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/theme/_themes.dart';

class PostCard extends StatelessWidget {
  final String? content;
  final String? photo;
  final int likeCount;
  final int dislikeCount;
  final String postId;
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
    required this.userId,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the post detail page when the card is tapped.
        if (navigate) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PostDetailPage(
                content: content,
                photo: photo,
                likeCount: likeCount,
                dislikeCount: dislikeCount,
                postId: postId,
                userId: userId,
                homeBloc: bloc,
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
                        "User $userId",
                        style: CapstoneFontTheme.white.bodyBold,
                      ),
                      const Text(
                        "Computer Science",
                        style: CapstoneFontTheme.greySecondary,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert,
                    color: CapstoneColors.greySecondary,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                content ?? '',
                style: CapstoneFontTheme.white,
              ),
              const SizedBox(
                height: 20,
              ),
              if (photo != null) ...[
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(photo!),
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
                      bloc.add(LikePostEvent(
                        postId: postId,
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
                    likeCount.toString(),
                    style: CapstoneFontTheme.greySecondary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle disliking the post
                      bloc.add(LikePostEvent(
                        postId: postId,
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
                    dislikeCount.toString(),
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
