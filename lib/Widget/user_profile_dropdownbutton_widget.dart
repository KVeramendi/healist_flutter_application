import 'package:flutter/material.dart';

class UserProfileDropDownButtonWidget extends StatefulWidget {
  final String label;
  final List<String> items;
  final String value;
  final ValueChanged onChanged;
  const UserProfileDropDownButtonWidget(
      {Key? key,
      required this.label,
      required this.items,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  State<UserProfileDropDownButtonWidget> createState() =>
      _UserProfileDropDownButtonWidgetState();
}

class _UserProfileDropDownButtonWidgetState
    extends State<UserProfileDropDownButtonWidget> {
  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.label,
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0)),
            height: 48.0,
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    items: widget.items.map(buildMenuItem).toList(),
                    value: widget.value,
                    onChanged: widget.onChanged,
                    icon: const Icon(Icons.arrow_drop_down, size: 26.0),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(12.0))))
      ]);

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
