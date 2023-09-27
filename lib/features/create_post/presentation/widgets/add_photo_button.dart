part of '_widgets.dart';

class AddPhotoButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final IconData? icon;
  const AddPhotoButton({
    required this.onPressed,
    required this.text,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(CapstoneColors.greySecondary)),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: CapstoneColors.blackPrimary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: CapstoneFontTheme.black,
                ),
              ],
            )
          : Text(
              text,
              style: CapstoneFontTheme.black,
            ),
    );
  }
}
