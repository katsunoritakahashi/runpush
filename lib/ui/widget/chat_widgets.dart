import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTextInputForm extends StatelessWidget {
  const ChatTextInputForm({
    super.key,
    this.formKey,
    this.focus,
    this.onChanged,
    required this.maxLines,
    required this.hintText,
  });

  final Key? formKey;
  final FocusNode? focus;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        focusNode: focus,
        decoration: InputDecoration(
          hintText: hintText,
          counterText: '',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: maxLines,
        maxLength: 500,
        onChanged: onChanged,
      ),
    );
  }
}

class FormBottom extends StatelessWidget {
  const FormBottom({
    super.key,
    required this.onPressedSendButton,
    required this.isValid,
  });

  final VoidCallback onPressedSendButton;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Spacer(),
        if (isValid)
          IconButton(
            icon: const Icon(
              Icons.send,
            ),
            color: Get.theme.primaryColor,
            onPressed: isValid ? onPressedSendButton : null,
          ),
      ],
    );
  }
}

class ChatMessageForm extends StatelessWidget {
  const ChatMessageForm({
    super.key,
    required this.filling,
    required this.isValid,
    required this.textInputFormKey,
    required this.textInputFormFocus,
    required this.onChangedTextInputForm,
    required this.onPressedSendButton,
    this.maxLines = 4,
    this.hintText = 'メッセージを入力',
  });

  final bool filling;
  final bool isValid;
  final Key textInputFormKey;
  final FocusNode textInputFormFocus;
  final ValueChanged<String> onChangedTextInputForm;
  final VoidCallback onPressedSendButton;
  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(
          height: 1,
        ),
        ColoredBox(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: ChatTextInputForm(
                        formKey: textInputFormKey,
                        focus: textInputFormFocus,
                        onChanged: onChangedTextInputForm,
                        maxLines: maxLines,
                        hintText: hintText,
                      ),
                    ),
                  ],
                ),
              ),
              if (filling)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FormBottom(onPressedSendButton: onPressedSendButton, isValid: isValid),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
