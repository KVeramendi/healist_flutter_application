import 'package:flutter/material.dart';

class UserProfileTextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String>? onChanged;
  final bool? isNumerical;
  final bool isEditable;
  const UserProfileTextFieldWidget(
      {Key? key,
      required this.label,
      required this.text,
      this.onChanged,
      this.isNumerical,
      required this.isEditable})
      : super(key: key);

  @override
  State<UserProfileTextFieldWidget> createState() =>
      _UserProfileTextFieldWidgetState();
}

class _UserProfileTextFieldWidgetState
    extends State<UserProfileTextFieldWidget> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.label,
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        widget.isEditable
            ? TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent.shade700),
                        borderRadius: BorderRadius.circular(12.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0))),
                keyboardType:
                    widget.isNumerical != null && widget.isNumerical == true
                        ? TextInputType.number
                        : TextInputType.text,
                onChanged: widget.onChanged)
            : Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(12.0)),
                child:
                    Text(widget.text, style: const TextStyle(fontSize: 16.0))),
      ]);
}
