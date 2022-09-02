import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  const SearchWidget(
      {Key? key,
      required this.text,
      required this.onChanged,
      required this.hintText})
      : super(key: key);
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black54);
    const styleHint = TextStyle(color: Colors.black45);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(12.0)),
        height: 42.0,
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
                icon: Icon(Icons.search, color: style.color),
                hintText: widget.hintText,
                hintStyle: style,
                suffixIcon: widget.text.isNotEmpty
                    ? GestureDetector(
                        child: Icon(Icons.close_rounded, color: style.color),
                        onTap: () {
                          controller.clear();
                          widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      )
                    : null,
                border: InputBorder.none),
            style: style,
            onChanged: widget.onChanged));
  }
}
