import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatefulWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppBarWidget({Key? key, this.title, this.actions})
      : super(key: key);

  @override
  State<CustomAppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) => AppBar(
      leading: const BackButton(color: Colors.black87),
      title: widget.title != null
          ? Text('${widget.title}',
              style: const TextStyle(color: Colors.black87))
          : null,
      actions: widget.actions,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: widget.title != null ? true : false);
}
