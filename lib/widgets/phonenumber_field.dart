import 'package:flutter/material.dart';
import 'package:rafiq/config.dart';
import 'package:rafiq/widgets/label_button.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

typedef PhonenumberController = ValueNotifier<Map<String, dynamic>?>;

class PhonenumberTextField extends StatefulWidget {
  const PhonenumberTextField(
      {super.key,
      required this.controller,
      this.textInputAction = TextInputAction.next});
  final PhonenumberController controller;
  final TextInputAction textInputAction;
  @override
  State<PhonenumberTextField> createState() => _PhonenumberTextFieldState();
}

String myFormatNumber(String text, CountryWithPhoneCode country) {
  return formatNumberSync(text,
      country: country,
      removeCountryCodeFromResult: true,
      inputContainsCountryCode: false);
}

class _PhonenumberTextFieldState extends State<PhonenumberTextField> {
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
