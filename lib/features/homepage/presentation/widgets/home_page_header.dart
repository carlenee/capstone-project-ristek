part of '_widgets.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          backgroundColor: CapstoneColors.purple,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Arvin",
              style: CapstoneFontTheme.white,
            ),
            Text(
              "Computer Science 2022",
              style: CapstoneFontTheme.greySecondary,
            )
          ],
        ),
        IconButton(
            onPressed: () {
              nav.push(const CreatePostPage());
            },
            icon: const Icon(
              Icons.add_rounded,
              color: CapstoneColors.purple,
            ))
      ],
    );
  }
}
