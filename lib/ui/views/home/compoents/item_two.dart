import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tomisha/theme/app_colors.dart';
import 'package:tomisha/theme/app_images.dart';
import 'package:tomisha/ui/components/wavy_container.dart';

class ItemTwo extends StatefulWidget {
  final TabController controller;
  const ItemTwo({super.key, required this.controller});

  @override
  State<ItemTwo> createState() => _ItemTwoState();
}

class _ItemTwoState extends State<ItemTwo> {
  @override
  void initState() {
    widget.controller.addListener(onTabChange);
    super.initState();
  }

  int index = 0;

  final List<(String, String)> data = [
    ("Erstellen dein Lebenslauf", AppImages.ar2BG),
    ("Erstellen ein Jobinserat", AppImages.ar22BG),
    ("Erhalte Vermittlungs- angebot von Arbeitgeber", AppImages.ar23BG)
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
      return WavyContainer(
          padding: EdgeInsets.zero,
          height: 520,
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 61,
                  ),
                  Text(
                    "2.",
                    style: const TextStyle().copyWith(
                        fontSize: 130, color: AppColors.steelBlueColor),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: AutoSizeText(
                        data[index].$1,
                        style: const TextStyle().copyWith(
                            fontSize: 30, color: AppColors.steelBlueColor),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    data[index].$2,
                    alignment: Alignment.topCenter,
                  )),
            ],
          ));
    }, desktop: (BuildContext context) {
      return WavyContainer(
          height: 370,
          color: Colors.transparent,
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              // SvgPicture.asset(AppImages.ar2BG),
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    data[index].$2,
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 61,
                  ),
                  Text(
                    "2.",
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
                ],
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ));
    });
  }
}
