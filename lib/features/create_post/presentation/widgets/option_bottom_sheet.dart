part of '_widgets.dart';

class OptionBottomSheet {
  static Future<dynamic> showObjectBotttomSheet({
    required BuildContext context,
    required CreatePostBloc bloc,
  }) {
    final height = MediaQuery.of(context).size.height;
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      context: context,
      builder: (context) => Container(
        height: height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: CapstoneColors.blackPrimary),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 8,
                  width: 36,
                  decoration: BoxDecoration(
                    color: CapstoneColors.purple,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  print('pressed');
                  bloc.add(PickImageFromGallery());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose photo or video",
                      style: CapstoneFontTheme.greySecondaryMedium,
                    ),
                    Icon(
                      Icons.photo_outlined,
                      color: CapstoneColors.greySecondary,
                    )
                  ],
                ),
              ),
              Spacer(),
              Divider(
                color: CapstoneColors.grey,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Take photo or video",
                      style: CapstoneFontTheme.greySecondaryMedium,
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: CapstoneColors.greySecondary,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
