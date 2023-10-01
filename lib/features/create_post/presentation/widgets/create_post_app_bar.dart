part of '_widgets.dart';

class CreatePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final CreatePostBloc bloc;
  final TextEditingController? textController;
  final bool isEdit;
  final String? postId;
  final String? prevImageUrl;
  const CreatePostAppBar({
    this.textController,
    required this.context,
    required this.bloc,
    this.postId,
    this.prevImageUrl,
    this.isEdit = false,
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
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: CapstoneColors.purple,
        ),
      ),
      title: Text(
        isEdit ? "Edit a Post" : "Create A Post",
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
                    print(postId);
                    isEdit
                        ? bloc.add(EditPostEvent(
                            postId: postId!,
                            pickedImage: state.pickedImage?.path ?? '',
                            content: textController!.text))
                        : bloc.add(
                            UploadPostEvent(
                                pickedImage: state.pickedImage?.path ?? '',
                                content: textController!.text),
                          );
                  }
                },
                child: Text(
                  isEdit ? 'Edit' : 'Post',
                  style: CapstoneFontTheme.purple,
                ));
          },
        )
      ],
    );
  }
}
