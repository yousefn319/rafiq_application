import 'package:flutter/material.dart';
import 'package:rafiq/main.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

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
  State<PasswordField> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;
  void toggle() => setState(() {
        _obscure = !_obscure;
      });

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
                  onPressed: toggle)),
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
  final List<String> autofillHints;
  final TextInputAction textInputAction;
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

typedef PhonenumberController = ValueNotifier<Map<String, dynamic>?>;

class PhonenumberTextField extends StatefulWidget {
  const PhonenumberTextField(
      {super.key,
      required this.controller,
      this.textInputAction = TextInputAction.next});
  final PhonenumberController controller;
  final TextInputAction textInputAction;
  @override
  State<PhonenumberTextField> createState() => PhonenumberTextFieldState();
}

String myFormatNumber(String text, CountryWithPhoneCode country) {
  return formatNumberSync(text,
      country: country,
      removeCountryCodeFromResult: true,
      inputContainsCountryCode: false);
}

class PhonenumberTextFieldState extends State<PhonenumberTextField> {
  late FocusNode _node;
  late CountryWithPhoneCode currentRegion;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _node = FocusNode(debugLabel: 'PhonenumberTextField');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentRegion = ConfigProvider.of(context).supportedRegions['EG']!;
  }

  @override
  void dispose() {
    _node.dispose();
    controller.dispose();
    super.dispose();
  }

  Widget builder(
      BuildContext context, MenuController controller, Widget? child) {
    return LabelButton(
        focusNode: _node,
        label: '${currentRegion.countryCode} +${currentRegion.phoneCode} ',
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open());
  }

  @override
  Widget build(BuildContext context) {
    ConfigProvider config = ConfigProvider.of(context);
    return TextFormField(
        inputFormatters: [
          LibPhonenumberTextFormatter(
              country: currentRegion,
              shouldKeepCursorAtEndOfInput: false,
              onFormatFinished: (val) =>
                  parse(val, region: currentRegion.countryCode)
                      .then((v) => widget.controller.value =
                          v['type'] != 'mobile' ? null : v)
                      .catchError((_) => widget.controller.value = null))
        ],
        controller: controller,
        validator: (val) =>
            widget.controller.value == null ? "Invalid phonenumber" : null,
        keyboardType: TextInputType.phone,
        textInputAction: widget.textInputAction,
        autofillHints: const [AutofillHints.telephoneNumberLocal],
        decoration: InputDecoration(
          labelText: 'Phone',
          hintText: myFormatNumber(
              currentRegion.exampleNumberMobileInternational, currentRegion),
          prefixIcon: const Icon(Icons.phone),
          prefix: ExcludeFocus(
              child: MenuAnchor(
                  builder: builder,
                  childFocusNode: _node,
                  menuChildren: config.supportedRegions.entries
                      .map((entry) => MenuItemButton(
                          onPressed: () => setState(() {
                                controller.text = myFormatNumber(
                                    controller.text, entry.value);
                                currentRegion = entry.value;
                              }),
                          child:
                              Text("${entry.key} +${entry.value.phoneCode}")))
                      .toList())),
        ));
  }
}

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
