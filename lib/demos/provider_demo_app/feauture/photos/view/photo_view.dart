import 'package:flutter/material.dart';
import 'package:flutter101/demos/provider_demo_app/core/product/manager/shop/shop_manager.dart';
import 'package:flutter101/demos/provider_demo_app/core/product/widget/photo_card.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/photos/viewModel/photos_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

final _viewModel = PhotosViewModel();

class PhotosView extends StatelessWidget {
  const PhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildObserverLoading(),
        actions: [buildActionChip(context)],
      ),
      body: buildGridBuilder(),
    );
  }

  Observer buildObserverLoading() {
    return Observer(builder: (_) {
      return Visibility(
        visible: _viewModel.isLoading,
        child: const CircularProgressIndicator(),
      );
    });
  }

  Widget buildGridBuilder() {
    return Observer(builder: (_) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: _viewModel.photos.length,
        itemBuilder: (context, index) => Card(
          child: PhotoCard(model: _viewModel.photos[index]),
        ),
      );
    });
  }

  ActionChip buildActionChip(BuildContext context) {
    return ActionChip(
      label: Text("\$ ${context.watch<ShopManager>().totalMoney.toString()}"),
      avatar: const Icon(Icons.shopping_bag_outlined),
      onPressed: () {},
    );
  }
}
