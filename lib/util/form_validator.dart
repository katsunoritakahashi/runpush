import 'package:validators/validators.dart';

import '../constant/app_strings.dart';
import '../model/form_validation.dart';

class FormValidator {
  FormValidator._() {
    throw AssertionError('private constructor');
  }

  static FormValidation validateRequiredDropDown({int? value}) {
    if (value == null || value == 0) {
      return FormValidation.ngDropDown();
    }
    return FormValidation.ok();
  }

  static FormValidation validateDateTimeAfterNow({String? endAt}) {
    if (endAt == null || endAt == '') {
      return FormValidation.ngDropDown();
    }

    if (DateTime.parse(endAt).isBefore(DateTime.now())) {
      return FormValidation.ngAfterTime();
    }

    return FormValidation.ok();
  }

  static FormValidation validateNullableEmail(String? value) {
    if (value == null || value.isEmpty) {
      return FormValidation.ok();
    }
    return _validateEmail(value);
  }

  static FormValidation validateRequireEmail(String? value) {
    if (value == null || value.isEmpty) {
      return FormValidation.empty();
    }
    return _validateEmail(value);
  }

  static FormValidation _validateEmail(String value) {
    if (_hasFullWidthString(value)) {
      return FormValidation(
        isValid: false,
        message: Strings.fullWidthCharExist,
      );
    }

    if (isEmail(value)) {
      return FormValidation.ok();
    }
    return FormValidation(
      isValid: false,
      message: Strings.notEmailError,
    );
  }

  static FormValidation validateRequirePoint({
    String? value,
    required int maxLength,
  }) {
    if (value == null || value.isEmpty) {
      return FormValidation.ngMessage();
    }
    if (!isLength(value, 1, maxLength)) {
      return FormValidation.ngDigit(max: maxLength);
    }
    return FormValidation.ok();
  }

  static FormValidation validateRequirePointRange({
    String? value,
    required int minPoint,
    required int maxPoint,
  }) {
    if (value == null || value.isEmpty) {
      return FormValidation.ngMessage();
    }
    if (int.parse(value) < minPoint || int.parse(value) > maxPoint) {
      return FormValidation.ngPointRange(min: minPoint, max: maxPoint);
    }
    return FormValidation.ok();
  }

  static FormValidation validateRequirePasswordRange({
    String? value,
    required int minLength,
    required int maxLength,
  }) {
    if (value == null || value.isEmpty) {
      return FormValidation.ngMessage();
    }
    if (!isLength(value, minLength, maxLength)) {
      return FormValidation.ngRange(min: minLength, max: maxLength);
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return FormValidation.ngRegExpPasswordMessage();
    }
    return FormValidation.ok();
  }

  static FormValidation validateEditBasicInfo({
    String? value,
    required int maxLength,
  }) {
    if (value == null || value.isEmpty) {
      return FormValidation.ngMessage();
    }
    if (!isLength(value, 1, maxLength)) {
      return FormValidation.ngLength(max: maxLength);
    }
    return FormValidation.ok();
  }

  static FormValidation validateConfirmPasswordInfo({
    String? value,
    required String password,
  }) {
    if (value == null || value.isEmpty) {
      return FormValidation.ngMessage();
    }
    if (value != password) {
      return FormValidation.ngPassword();
    }
    return FormValidation.ok();
  }

  static bool _hasFullWidthString(String text) => RegExp(r'[^\x01-\x7E]+').hasMatch(text);

  static FormValidation validateInquiryBody(String? value) {
    if (value == null || value.isEmpty) {
      return FormValidation.empty();
    }

    const maxLength = 1000;
    if (!isLength(value, 0, maxLength)) {
      return FormValidation.ngLength(min: null, max: maxLength);
    }

    return FormValidation.ok();
  }

  static FormValidation validateReportDetail(String? value) {
    if (value == null || value.isEmpty) {
      return FormValidation.empty();
    }

    const maxLength = 1000;
    if (!isLength(value, 0, maxLength)) {
      return FormValidation.ngLength(min: null, max: maxLength);
    }

    return FormValidation.ok();
  }
}
