import 'package:flutter/material.dart';

class CustomDropDownButtonWidget extends StatelessWidget {
  final String label;
  final List<String> items;
  final String value;
  final ValueChanged onChanged;
  const CustomDropDownButtonWidget(
      {Key? key,
      required this.label,
      required this.items,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label,
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
                    items: items.map(buildMenuItem).toList(),
                    value: value,
                    onChanged: onChanged,
                    icon: const Icon(Icons.arrow_drop_down, size: 26.0),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(12.0))))
      ]);

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
