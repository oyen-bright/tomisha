import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tomisha/theme/app_colors.dart';
import 'package:tomisha/theme/app_images.dart';

class ItemOne extends StatefulWidget {
  final TabController controller;
  const ItemOne({super.key, required this.controller});

  @override
  State<ItemOne> createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {
  @override
  void initState() {
    widget.controller.addListener(onTabChange);
    super.initState();
  }

  int index = 0;

  final List<(String, String)> data = [
    ("Erstellen dein Unternehmensprofil", AppImages.ar1BG),
    ("Erstellen dein Unternehmensprofil", AppImages.ar1BG),
    ("Erstellen dein Unternehmensprofil", AppImages.ar1BG)
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
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  data[index].$2,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: AppColors.steelBlueColor.withOpacity(0.05),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "1.",
                      style: const TextStyle().copyWith(
                          fontSize: 130, color: AppColors.steelBlueColor),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: AutoSizeText(
                          data[index].$1,
                          style: const TextStyle().copyWith(
                              fontSize: 30, color: AppColors.steelBlueColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
      desktop: (BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: AppColors.steelBlueColor.withOpacity(0.05),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "1.",
                      style: const TextStyle().copyWith(
                          fontSize: 130, color: AppColors.steelBlueColor),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Text(
                        data[index].$1,
                        style: const TextStyle().copyWith(
                            fontSize: 30, color: AppColors.steelBlueColor),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
                flex: 5,
                child: SvgPicture.asset(
                  data[index].$2,
                  alignment: Alignment.centerLeft,
                )),
            // SvgPicture.asset(AppImages.ar1BG),
            const Spacer(
              flex: 3,
            )
          ],
        );
      },
    );
  }
}
