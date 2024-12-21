import 'package:flutter/material.dart';
import 'package:rafiq_application/main.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class PasswordField extends StatefulWidget {
  PasswordField(
      {super.key,
      required this.label,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.cursorColor,
      this.controller,
      this.prefixIcon,
      this.validator});
  String label;
  InputBorder? border;
  InputBorder? enabledBorder;
  InputBorder? focusedBorder;
  Color? cursorColor;
  TextEditingController? controller;
  Widget? prefixIcon;
  FormFieldValidator<String>? validator;
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
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.prefixIcon,
        border: widget.border,
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusedBorder,
        suffixIcon: IconButton(
            icon: _obscure
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: toggle),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

class DefaultPassword extends StatelessWidget {
  DefaultPassword({super.key, required this.label, this.controller});
  String label;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return PasswordField(
      prefixIcon: const Icon(Icons.lock),
      label: label,
      validator: (value) {
        int len = value?.length ?? 0;
        if (len > 72) {
          return "Password too long";
        } else if (len < 8) {
          return "Password too short";
        }
        return null;
      },
      controller: controller,
    );
  }
}

class PhonenumberTextField extends StatefulWidget {
  PhonenumberTextField({super.key, required this.controller});
  TextEditingController controller;
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
    super.dispose();
    _node.dispose();
  }

  Widget builder(
      BuildContext context, MenuController controller, Widget? child) {
    return LabelButton(
        focusNode: _node,
        onPressed: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        label: '${currentRegion.countryCode} +${currentRegion.phoneCode} ');
  }

  @override
  Widget build(BuildContext context) {
    ConfigProvider config = ConfigProvider.of(context);
    return TextFormField(
      inputFormatters: [LibPhonenumberTextFormatter(country: currentRegion)],
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone',
        hintText: myFormatNumber(
            currentRegion.exampleNumberMobileInternational, currentRegion),
        prefixIcon: const Icon(Icons.phone),
        prefix: MenuAnchor(
            childFocusNode: _node,
            menuChildren: config.supportedRegions.entries
                .map((entry) => MenuItemButton(
                    onPressed: () => setState(() {
                          widget.controller.text = myFormatNumber(
                              widget.controller.text, entry.value);
                          currentRegion = entry.value;
                        }),
                    child: Text("${entry.key} +${entry.value.phoneCode}")))
                .toList(),
            builder: builder),
      ),
    );
  }
}

class LabelButton extends StatelessWidget {
  LabelButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.focusNode,
      this.style});
  String label;
  TextStyle? style;
  FocusNode? focusNode;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
        focusNode: focusNode,
        onTap: onPressed,
        child: Text(label, style: style));
  }
}
