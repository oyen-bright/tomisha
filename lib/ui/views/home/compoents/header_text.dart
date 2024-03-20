import 'package:flutter/material.dart';
import 'package:tomisha/theme/app_colors.dart';

class HeaderText extends StatefulWidget {
  final TabController controller;
  const HeaderText({super.key, required this.controller});

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  void initState() {
    widget.controller.addListener(onTabChange);
    super.initState();
  }

  int index = 0;

  final List<String> data = [
    ("Drei einfache Schritte\nzu deinem neuen Job"),
    ("Drei einfache Schritte zu deinem neuen Mitarbeiter"),
    ("Drei einfache Schritte zur Vermittlung neuer Mitarbeiter"),
  ];
  void onTabChange() {
    setState(() {
      index = widget.controller.index;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(onTabChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data[index],
      textAlign: TextAlign.center,
      style:
          const TextStyle().copyWith(fontSize: 40, color: AppColors.slateColor),
    );
  }
}
