import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool useDarkColors, supportButtonEnabled;
  final Color? backgroundColor;
  final String? backRoute;
  final List<Widget>? actions;
  final VoidCallback? onPressed;

  const CustomAppBar({
    Key? key,
    this.title,
    this.backRoute,
    this.backgroundColor,
    this.useDarkColors = true,
    this.supportButtonEnabled = true,
    this.actions,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        color: useDarkColors ? Colors.greenAccent : Colors.white,
        onPressed: onPressed ??
                () {
              backRoute == null ? Get.back() : Get.offNamed(backRoute!);
            },
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          size: 25,
          color: useDarkColors ? Colors.black : Colors.white,
        ),
      ),
      titleSpacing: 25,
      centerTitle: true,
      title: Text(
        title ?? '', style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: backgroundColor ?? Colors.greenAccent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
