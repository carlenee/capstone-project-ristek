import 'package:flutter/material.dart';

import '../../../../core/theme/_themes.dart';

class PostCard extends StatelessWidget {
  final String? content;
  final String? photo;
  const PostCard({this.content, this.photo, super.key});

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
              const Row(
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
                        "Yuda",
                        style: CapstoneFontTheme.white,
                      ),
                      Text(
                        "Computer Science 2020",
                        style: CapstoneFontTheme.greySecondary,
                      ),
                    ],
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
