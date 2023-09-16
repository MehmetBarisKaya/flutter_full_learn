import 'package:flutter/material.dart';
import 'package:flutter101/product/mixin/navigator_mixin.dart';
import 'package:flutter101/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          router.pushToPage(NavigateRoutes.detail, arguments: "bk");
          // NavigatorManager.instance.pushToPage(NavigateRoutes.detail, arguments: "bk");
          //Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf, arguments: "abc");
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
