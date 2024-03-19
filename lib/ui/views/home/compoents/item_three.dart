import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tomisha/theme/app_colors.dart';
import 'package:tomisha/theme/app_images.dart';

class ItemThree extends StatefulWidget {
  final TabController controller;
  const ItemThree({super.key, required this.controller});

  @override
  State<ItemThree> createState() => _ItemThreeState();
}

class _ItemThreeState extends State<ItemThree> {
  @override
  void initState() {
    widget.controller.addListener(onTabChange);
    super.initState();
  }

  int index = 0;

  final List<(String, String)> data = [
    ("Mit nur einem Klick\nbewerben", AppImages.ar3BG),
    ("Wähle deinen neuen Mitarbeiter aus", AppImages.ar32BG),
    ("Vermittlung nach Provision oder Stundenlohn", AppImages.ar33BG)
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
    return ScreenTypeLayout.builder(mobile: (BuildContext context) {
      return Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 110,
                backgroundColor: AppColors.steelBlueColor.withOpacity(0.05),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 75,
                  ),
                  Text(
                    "3.",
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
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
          // SvgPicture.asset(AppImages.ar3BG),
          Padding(
            padding: const EdgeInsets.only(left: 75),
            child: SvgPicture.asset(
              data[index].$2,
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      );
    }, desktop: (BuildContext context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 110,
                    backgroundColor: AppColors.steelBlueColor.withOpacity(0.05),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "3.",
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
                        width: 71,
                      ),
                    ],
                  ),
                ],
              ),
              // SvgPicture.asset(AppImages.ar3BG),
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    data[index].$2,
                    alignment: Alignment.centerLeft,
                  )),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ],
      );
    });
  }
}
