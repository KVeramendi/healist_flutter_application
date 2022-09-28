import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppBarWidget({Key? key, this.title, this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
      leading: const BackButton(color: Colors.black87),
      title: title != null
          ? Text('$title', style: const TextStyle(color: Colors.black87))
          : null,
      actions: actions,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: title != null ? true : false);
}
