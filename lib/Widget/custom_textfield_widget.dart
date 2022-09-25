import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final bool isPassword;
  final String? text;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool readOnly;
  const CustomTextFieldWidget(
      {Key? key,
      this.controller,
      required this.label,
      this.isPassword = false,
      this.text,
      this.onChanged,
      this.keyboardType = TextInputType.none,
      this.readOnly = false})
      : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController =
        TextEditingController(text: widget.text);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(widget.label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
      TextField(
          obscureText: widget.isPassword ? _obscureText : false,
          controller:
              widget.isPassword ? widget.controller : _textEditingController,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                      icon: _obscureText
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility_rounded))
                  : null,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent.shade700),
                  borderRadius: BorderRadius.circular(12.0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          keyboardType: widget.keyboardType,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged)
    ]);
  }
}
