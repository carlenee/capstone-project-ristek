part of '_widgets.dart';

class PostTextField extends StatelessWidget {
  const PostTextField({
    required this.controller,
    required this.hint,
    this.obscure = false,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1 / 4,
      width: MediaQuery.of(context).size.width * 3 / 4,
      child: TextField(
        maxLines: null,
        expands: true,
        controller: controller,
        textAlign: TextAlign.start,
        obscureText: obscure,
        decoration: InputDecoration(
            filled: true,
            labelText: hint,
            labelStyle: CapstoneFontTheme.greySecondary,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CapstoneColors.greySecondary),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: CapstoneColors.purple))),
        cursorColor: CapstoneColors.greySecondary,
        style: const TextStyle(color: CapstoneColors.greySecondary),
      ),
    );
  }
}
