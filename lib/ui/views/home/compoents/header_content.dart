import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tomisha/theme/app_colors.dart';
import 'package:tomisha/theme/app_images.dart';
import 'package:tomisha/ui/components/wavy_container.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return Stack(
          children: [
            _buildMobileContainer(context),
            // _buildMobileRegisterButton(context)
          ],
        );
      },
      desktop: (BuildContext context) {
        return _buildDesktopContainer();
      },
    );
  }

  WavyContainer _buildDesktopContainer() {
    return WavyContainer(
      height: 659,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Deine Job\nwebsite",
                textAlign: TextAlign.left,
                style: const TextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  height: 1,
                  fontSize: 65,
                ),
              ),
              const SizedBox(height: 65),
              _buildDesktopRegisterButton()
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 199,
            child: ClipOval(
              child: SvgPicture.asset(
                AppImages.homeBG,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  Container _buildDesktopRegisterButton() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF319795),
              Color(0xFF3182CE),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12)),
      width: 320,
      height: 40,
      child: Text(
        "Kostenlos Registrieren",
        textAlign: TextAlign.left,
        style: const TextStyle().copyWith(
          // fontWeight: FontWeight.w600,
          color: Colors.white,

          fontSize: 14,
        ),
      ),
    );
  }

  WavyContainer _buildMobileContainer(context) {
    return WavyContainer(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Deine Job\nwebsite",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              fontSize: 45,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SvgPicture.asset(AppImages.homeBG),
        ],
      )),
    );
  }

  Positioned _buildMobileRegisterButton(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
            height: 128,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.transparentBlack,
                  offset: Offset(3, -3),
                  blurRadius: 6,
                ),
              ],
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF319795),
                      Color(0xFF3182CE),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              width: 319,
              height: 40,
              child: Text(
                "Kostenlos Registrieren",
                textAlign: TextAlign.left,
                style: const TextStyle().copyWith(
                  // fontWeight: FontWeight.w600,
                  color: Colors.white,

                  fontSize: 14,
                ),
              ),
            )));
  }
}
