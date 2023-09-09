import 'package:flutter/material.dart';
import 'package:flutter101/202/image_learn_202.dart';
import 'package:flutter101/303/reqres_resources/service/reqres_service.dart';
import 'package:flutter101/303/reqres_resources/viewModel/reqres_provider.dart';
import 'package:flutter101/product/extension/string_extension.dart';
import 'package:flutter101/product/global/resource_context.dart';
import 'package:flutter101/product/global/theme_notifier.dart';
import 'package:flutter101/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqResViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqResService(service)),
      builder: (context, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ThemeNotifer>().changeTheme();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          actions: const [_SaveAndNavigateIconButton()],
          title: context.watch<ReqResProvider>().isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : null,
        ),
        body: Column(
          children: [
            const _TempPlaceHolder(),
            Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resources)),
          ],
        ),
      ),
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(color: Color(items[index].color?.colorValue ?? 0), child: Text(items[index].name ?? " "));
        });
  }
}

class _SaveAndNavigateIconButton extends StatelessWidget {
  const _SaveAndNavigateIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<ReqResProvider>().saveToLocal(context.read<ResourceContext>());
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ImageLearn202(),
          ));
        },
        icon: const Icon(Icons.add));
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder();

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(
      builder: (context, value, child) {
        return value ? const Placeholder() : const Text("data");
      },
      selector: (context, provider) {
        return provider.isLoading;
      },
    );
  }
}
