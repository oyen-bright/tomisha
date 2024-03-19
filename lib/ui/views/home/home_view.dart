import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tomisha/theme/app_colors.dart';
import 'package:tomisha/theme/app_images.dart';
import 'package:tomisha/ui/components/app_bar.dart';
import 'package:tomisha/ui/components/app_tab_bar.dart';
import 'package:tomisha/ui/views/home/compoents/item_one.dart';
import 'package:tomisha/ui/views/home/compoents/item_three.dart';
import 'package:tomisha/ui/views/home/compoents/item_two.dart';

import 'compoents/header_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Header(),
                const SizedBox(
                  height: 35,
                ),
                _buildTab(),
                const SizedBox(
                  height: 55,
                ),
                _buildBody(context),
              ],
            ),
          ),
          AppAppBar(controller: controller)
        ],
      ),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Drei einfache Schritte\nzu deinem neuen Job",
          textAlign: TextAlign.center,
          style: const TextStyle()
              .copyWith(fontSize: 40, color: AppColors.slateColor),
        ),
        const SizedBox(
          height: 98,
        ),
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemOne(
                    controller: _tabController,
                  ),
                  const SizedBox(
                    height: 189,
                  ),
                  ItemTwo(
                    controller: _tabController,
                  ),
                  const SizedBox(
                    height: 95,
                  ),
                  ItemThree(
                    controller: _tabController,
                  ),
                ],
              ),
              if (getDeviceType(MediaQuery.of(context).size) ==
                  DeviceScreenType.desktop) ...[
                Positioned(
                    top: 190,
                    left: 260,
                    child: SvgPicture.asset(AppImages.ar1Arrow)),
                Positioned(
                    top: 740,
                    right: 650,
                    child: SvgPicture.asset(AppImages.ar2Arrow))
              ]
            ],
          ),
        ),
        const SizedBox(
          height: 233,
        ),
      ],
    );
  }

  Align _buildTab() {
    return Align(
      alignment: Alignment.center,
      child: AppTabBar(
          tabController: _tabController,
          tabNames: const ["Arbeitnehmer", "Arbeitgeber", "Temporärbüro"]),
    );
  }
}
