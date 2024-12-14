import 'package:flutter/material.dart';

class DateOfBirth extends StatefulWidget {
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      cursorColor: const Color(0xff088395),
      decoration: const InputDecoration(
        labelText: 'Date of Birth',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xff071952),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: BorderSide.strokeAlignCenter,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xff088395),
          ),
        ),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            _controller.text =
                "${pickedDate.toLocal()}".split(' ')[0]; // Format the date
          });
        }
      },
    );
  }
}
