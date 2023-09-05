import 'package:flutter/material.dart';
import 'package:flutter101/202/package/launch_manager.dart';
import 'package:flutter101/demos/password_textfield.dart';

import '../package/package_loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUrlWithPackage("https://pub.dev/packages/url_launcher");
        },
      ),
      body: Column(
        children: const [
          PasswordTextField(),
          SizedBox(
            height: 10,
          ),
          LoadingBar(),
        ],
      ),
    );
  }
}
