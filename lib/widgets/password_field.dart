import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key,
      required this.label,
      this.cursorColor,
      this.controller,
      this.prefixIcon,
      this.validator,
      this.autofillHints,
      this.textInputAction});
  final String label;
  final Color? cursorColor;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final List<String>? autofillHints;
  final TextInputAction? textInputAction;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;
  void _toggle() => setState(() => _obscure = !_obscure);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: _obscure,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: widget.autofillHints,
        textInputAction: widget.textInputAction,
        maxLength: 72,
        decoration: InputDecoration(
          counterText: '',
          labelText: widget.label,
          prefixIcon: widget.prefixIcon,
          suffixIcon: ExcludeFocus(
              child: IconButton(
                  icon: _obscure
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: _toggle)),
        ));
  }
}

class DefaultPassword extends StatelessWidget {
  const DefaultPassword(
      {super.key,
      required this.label,
      this.controller,
      this.autofillHints = const [AutofillHints.password],
      this.textInputAction = TextInputAction.done});
  final String label;
  final TextEditingController? controller;
  final List<String>? autofillHints;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return PasswordField(
        autofillHints: autofillHints,
        prefixIcon: const Icon(Icons.lock),
        textInputAction: textInputAction,
        label: label,
        validator: (value) =>
            (value?.length ?? 0) < 8 ? "Password too short" : null,
        controller: controller);
  }
}
