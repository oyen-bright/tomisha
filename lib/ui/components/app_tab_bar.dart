import 'package:flutter/material.dart';
import 'package:tomisha/theme/app_colors.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({
    Key? key,
    required TabController tabController,
    required List<String> tabNames,
    Color? backgroundColor,
  })  : _tabController = tabController,
        _tabNames = tabNames,
        super(key: key);

  final TabController _tabController;
  final List<String> _tabNames;

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  late final List<(String, GlobalKey<State<StatefulWidget>>)> _tabDetails;

  @override
  void initState() {
    super.initState();
    _tabDetails = widget._tabNames.map((e) => (e, GlobalKey())).toList();

    widget._tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (widget._tabController.index != _currentIndex) {
      _currentIndex = widget._tabController.index;
      Scrollable.ensureVisible(_tabDetails[_currentIndex].$2.currentContext!,
              // duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignmentPolicy: _currentIndex == 0
                  ? ScrollPositionAlignmentPolicy.keepVisibleAtStart
                  : ScrollPositionAlignmentPolicy.keepVisibleAtEnd)
          .then((value) => setState(() {}));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    widget._tabController.removeListener(_handleTabSelection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      child: Container(
          // padding: widget._padding,
          height: 40,
          width: (160 * widget._tabController.length.toDouble()),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(color: AppColors.grayColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildTabs(context, _tabDetails),
          )),
    );
  }

  List<Widget> _buildTabs(BuildContext context,
      List<(String, GlobalKey<State<StatefulWidget>>)> tabDetails) {
    return tabDetails.asMap().entries.map((entry) {
      final index = entry.key;
      final tabName = entry.value.$1;
      final key = entry.value.$2;
      final isSelected = widget._tabController.index == index;

      return SizedBox(
        height: double.infinity,
        width: 159,
        child: InkWell(
            key: key,
            onTap: () {
              widget._tabController.animateTo(index);
            },
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: index == 0 || tabDetails.length - 1 == index
                        ? BorderRadius.horizontal(
                            left: index == 0
                                ? const Radius.circular(12)
                                : Radius.zero,
                            right: index != 0
                                ? const Radius.circular(12)
                                : Radius.zero)
                        : null,
                    border: Border.all(color: AppColors.grayColor),
                    color: isSelected
                        ? AppColors.turquoiseColor
                        : Colors.transparent),
                child: Text(
                  tabName,
                  style: const TextStyle().copyWith(
                      color: isSelected ? Colors.white : AppColors.tealColor),
                  textAlign: TextAlign.center,
                ))),
      );
    }).toList();
  }
}
