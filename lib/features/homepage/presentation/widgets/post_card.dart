import 'package:capstone_project/app.dart';
import 'package:capstone_project/features/create_post/presentation/pages/edit_post_page.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/_themes.dart';

class PostCard extends StatelessWidget {
  final PostModel postModel;
  const PostCard({required this.postModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        "User - ${postModel.userId}",
                        style: CapstoneFontTheme.white,
                      ),
                      const Text(
                        "Computer Science 2020",
                        style: CapstoneFontTheme.greySecondary,
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    disabledColor: CapstoneColors.grey,
                    onPressed: () {
                      nav.push(EditPostPage(
                        content: postModel.content,
                        imageUrl: postModel.photoUrl,
                        postId: postModel.id,
                      ));
                    },
                    icon: const Icon(Icons.edit),
                    color: CapstoneColors.purple,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                postModel.content,
                style: CapstoneFontTheme.white,
              ),
              const SizedBox(
                height: 20,
              ),
              ...[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(postModel.photoUrl),
              ),
            ],
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.favorite_outline_rounded,
                    color: CapstoneColors.greySecondary,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "99",
                    style: CapstoneFontTheme.greySecondary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: CapstoneColors.greySecondary,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "99",
                    style: CapstoneFontTheme.greySecondary,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
