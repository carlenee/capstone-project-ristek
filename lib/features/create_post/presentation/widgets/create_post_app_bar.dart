part of '_widgets.dart';

class CreatePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final CreatePostBloc bloc;
  final String? content;
  const CreatePostAppBar({
    this.content,
    required this.context,
    required this.bloc,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: CapstoneColors.blackPrimary,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: CapstoneColors.purple,
        ),
      ),
      title: Text(
        "Create a Post",
        style: CapstoneFontTheme.purpleheader,
      ),
      centerTitle: true,
      actions: [
        BlocConsumer<CreatePostBloc, CreatePostState>(
          bloc: bloc,
          listener: (context, state) async {
            if (state is CreatePostSuccess) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return TextButton(
                onPressed: () {
                  if (state is CreatePostLoaded) {
                    bloc.add(
                      UploadPostEvent(
                          pickedImage: state.pickedImage, content: content),
                    );
                  }
                },
                child: Text(
                  'Post',
                  style: CapstoneFontTheme.purple,
                ));
          },
        )
      ],
    );
  }
}
