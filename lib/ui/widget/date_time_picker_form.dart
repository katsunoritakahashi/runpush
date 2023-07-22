import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../common/ui_helper.dart';

class DateTimePickerForm extends StatelessWidget {
  DateTime selectedDateTime = DateTime.now();
  DateTimePickerForm({
    required this.initialDateTime,
    super.key,
    this.hintText,
    this.labelText,
    this.onChange,
    this.showInitialDate = false,
    this.fontSize = 16,
    this.validator,
  });

  final DateTime initialDateTime;
  final String? hintText;
  final String? labelText;
  final FormFieldSetter<DateTime>? onChange;
  final TextEditingController _controller = TextEditingController();
  final double fontSize;
  final bool showInitialDate;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    if (showInitialDate) {
      applyDateText(initialDateTime);
    }
    return GestureDetector(
      onTap: () => _selectDate(),
      child: AbsorbPointer(
        child: TextFormField(
          controller: _controller,
          style: TextStyle(fontSize: fontSize),
          decoration: defaultInputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: const Icon(Icons.calendar_month_sharp),
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DatePicker.showDateTimePicker(
      Get.context!,
      currentTime: selectedDateTime,
      maxTime: initialDateTime.add(const Duration(days: 7)),
      locale: LocaleType.jp,
      onConfirm: (DateTime dateTime) {
        onChange?.call(dateTime);
        // validator?.call(DateFormat.Hm().format(DateTime(2023, 4, 10, picked.hour, picked.minute)));
        applyDateText(dateTime);
      },
    );
  }

  void applyDateText(DateTime dateTime) {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H時m分');
    _controller.text = outputFormat.format(dateTime);
  }
}
