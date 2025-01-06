import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  const LabelButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.focusNode,
      this.style});
  final String label;
  final TextStyle? style;
  final FocusNode? focusNode;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle? style = onPressed == null
        ? this.style?.copyWith(color: theme.disabledColor)
        : this.style;
    return InkResponse(
        focusNode: focusNode,
        onTap: onPressed,
        child: Text(label, style: style));
  }
}
