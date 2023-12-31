import 'package:intl/intl.dart';

class FormValidation {
  FormValidation({required this.isValid, this.message});

  factory FormValidation.ok() => FormValidation(isValid: true);

  factory FormValidation.empty() => FormValidation(isValid: false, message: null);

  factory FormValidation.ngNumeric() {
    return FormValidation(isValid: false, message: '数字を入力してください');
  }

  factory FormValidation.ngLength({int? min, int? max}) {
    var tmpMessage = '';
    if (min != null && max != null && min == max) {
      tmpMessage = '$min文字で入力してください';
    } else {
      if (min != null) {
        tmpMessage += '$min文字以上';
      }
      if (max != null) {
        tmpMessage += '$max文字以内';
      }
      tmpMessage += 'で入力してください';
    }

    return FormValidation(isValid: false, message: tmpMessage);
  }

  factory FormValidation.ngPassword() {
    return FormValidation(isValid: false, message: 'パスワードが一致しません');
  }

  factory FormValidation.ngDropDown() {
    return FormValidation(isValid: false, message: '選択してください');
  }

  factory FormValidation.ngAfterTime() {
    return FormValidation(isValid: false, message: '開始時間より後の時間を選択してください');
  }

  factory FormValidation.ngDigit({int? min, int? max}) {
    var tmpMessage = '';
    if (min != null && max != null && min == max) {
      tmpMessage = '$min桁で入力してください';
    } else {
      if (min != null) {
        tmpMessage += '$min桁以上';
      }
      if (max != null) {
        tmpMessage += '$max桁以内';
      }
      tmpMessage += 'で入力してください';
    }

    return FormValidation(isValid: false, message: tmpMessage);
  }

  factory FormValidation.ngPointRange({int? min, int? max}) {
    final formatter = NumberFormat("#,###");
    return FormValidation(
        isValid: false, message: '${formatter.format(min)}〜${formatter.format(max)}Pで入力してください');
  }

  factory FormValidation.ngRange({int? min, int? max}) {
    return FormValidation(
        isValid: false, message: '$min〜$max文字で入力してください');
  }

  factory FormValidation.ngMail() {
    return FormValidation(isValid: false, message: 'メールアドレスを入力してください');
  }

  factory FormValidation.ngMessage() {
    return FormValidation(isValid: false, message: '入力して下さい');
  }

  factory FormValidation.ngRegExpPasswordMessage() {
    return FormValidation(isValid: false, message: '半角英数字で入力してください');
  }

  final bool isValid;
  final String? message;
}
