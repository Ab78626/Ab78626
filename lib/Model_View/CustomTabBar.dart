import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.tabBarItems,
    required this.tabViewItems,
    this.selectedCardColor,
    this.selectedTitleColor,
    this.unSelectedCardColor,
    this.unSelectedTitleColor,
    this.selectedTabElevation,
    this.duration,
    this.shape,
    this.tabBarItemExtend,
    this.padding,
    this.tabBarLocation,
    this.tabBarItemHeight,
    this.tabBarItemWidth,
    this.tabViewItemHeight,
    this.tabViewItemWidth,
    this.titleStyle,
  }) : super(key: key);

  final Color? selectedCardColor;
  final Color? unSelectedCardColor;
  final Color? selectedTitleColor;
  final Color? unSelectedTitleColor;

  final double? selectedTabElevation;
  final double? tabBarItemHeight;
  final double? tabBarItemWidth;
  final double? tabViewItemHeight;
  final double? tabViewItemWidth;
  final TextStyle? titleStyle;

  final List<String> tabBarItems;
  final List<Widget> tabViewItems;
  final Duration? duration;
  final RoundedRectangleBorder? shape;
  final double? tabBarItemExtend;
  final EdgeInsets? padding;
  final TabBarLocation? tabBarLocation;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

enum TabBarLocation {
  top,
  bottom,
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  void _changeSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(_selectedIndex,
          duration: widget.duration ?? const Duration(milliseconds: 200),
          curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.tabBarLocation == TabBarLocation.top ||
            widget.tabBarLocation == null
            ? _TabBarItems(context)
            : const SizedBox.shrink(),
        _TabViewItems(),
        widget.tabBarLocation == TabBarLocation.bottom
            ? _TabBarItems(context)
            : const SizedBox.shrink(),
      ],
    );
  }

  SizedBox _TabViewItems() {
    return SizedBox(
      height:
      widget.tabViewItemHeight ?? MediaQuery.of(context).size.height * 0.8,
      width: widget.tabViewItemWidth ?? MediaQuery.of(context).size.width,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) => _changeSelectedIndex(value),
        children: widget.tabViewItems,
      ),
    );
  }

  Padding _TabBarItems(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.01,
          ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: widget.tabBarItemWidth ?? MediaQuery.of(context).size.width,
            height: widget.tabBarItemHeight ??
                MediaQuery.of(context).size.height * 0.07,
            child: ListView.builder(
              itemCount: widget.tabBarItems.length,
              scrollDirection: Axis.horizontal,
              itemExtent: widget.tabBarItemExtend ??
                  MediaQuery.of(context).size.width * 0.33,
              itemBuilder: (context, index) {
                bool isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() {
                    _changeSelectedIndex(index);
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.unSelectedCardColor ??
                          _CustomTabBarColor().unSelectedCardColor,
                      border: isSelected
                          ? Border.all(
                        color: widget.selectedCardColor ??
                            _CustomTabBarColor().selectedCardColor,
                        width: 2.0,
                      )
                          : null,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Center(
                      child: Text(
                        widget.tabBarItems[index],
                        textAlign: TextAlign.center,
                        style: widget.titleStyle ??
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: isSelected
                                  ? widget.selectedTitleColor ??
                                  _CustomTabBarColor().selectedTitleColor
                                  : widget.unSelectedTitleColor ??
                                  _CustomTabBarColor()
                                      .unSelectedTitleColor,
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTabBarColor {
  final Color unSelectedCardColor = const Color.fromARGB(255, 255, 255, 255);
  final Color selectedCardColor = const Color.fromARGB(255, 204, 225, 11);
  final Color selectedTitleColor = Colors.black45;
  final Color unSelectedTitleColor = Colors.grey;
}
