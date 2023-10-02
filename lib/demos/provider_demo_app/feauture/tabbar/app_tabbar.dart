import 'package:flutter/material.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/basket/basket_view.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/photos/view/photo_view.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/tabbar/tab_model/tab_model.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TabModel> tabItems = [
      TabModel(
        title: "Photos",
        icon: Icons.ac_unit_outlined,
        page: const PhotosView(),
      ),
      TabModel(
        title: "Basket",
        icon: Icons.accessible_outlined,
        page: const BasketView(),
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: buildTabBar(tabItems),
        ),
        body: buildTabBarView(tabItems),
      ),
    );
  }

  TabBar buildTabBar(List<TabModel> tabItems) {
    return TabBar(
        tabs: List.generate(
            tabItems.length,
            (index) => Tab(
                  text: tabItems[index].title,
                  icon: Icon(tabItems[index].icon),
                )));
  }

  TabBarView buildTabBarView(List<TabModel> tabItems) {
    return TabBarView(
      children: tabItems.map((e) => e.page).toList(),
    );
  }
}
