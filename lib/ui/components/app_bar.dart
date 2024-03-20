import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tomisha/theme/app_colors.dart';

class AppAppBar extends StatefulWidget {
  final ScrollController controller;
  const AppAppBar({
    super.key,
    required this.controller,
  });

  @override
  State<AppAppBar> createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> {
  bool showButtons = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_handleScroll);
  }

  void _handleScroll() {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    final offset =
        deviceType == DeviceScreenType.mobile ? 67 + 659 / 1.3 : 67 + 659 / 2.3;

    final shouldShowTitle = widget.controller.offset > offset;

    if (showButtons != shouldShowTitle) {
      setState(() {
        showButtons = shouldShowTitle;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleScroll);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderBar(),
        Container(
          height: 67,
          width: double.infinity,
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: AppColors.transparentBlack,
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
            color: Colors.white,
          ),
          child: _buildOtherButtons(),
        ),
      ],
    );
  }

  Row _buildOtherButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showButtons &&
            getDeviceType(MediaQuery.of(context).size) ==
                DeviceScreenType.desktop) ...{
          Expanded(
              child: SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  "Jetzt Klicken",
                  style: const TextStyle().copyWith(fontSize: 19),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.grayColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(240, 50)),
                  child: const Text("Kostenlos Registrieren"),
                  onPressed: () {},
                )
              ],
            ),
          ))
        },
        _buildLoginButton(),
      ],
    );
  }

  Padding _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 19),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: AppColors.tealColor,
        ),
        child: Text(
          "Login",
          style: const TextStyle()
              .copyWith(fontWeight: FontWeight.w600, letterSpacing: 1),
        ),
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF319795),
            Color(0xFF3182CE),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(91 * (math.pi / 180)),
        ),
      ),
    );
  }
}
