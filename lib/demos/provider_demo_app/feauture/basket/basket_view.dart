import 'package:flutter/material.dart';
import 'package:flutter101/demos/provider_demo_app/core/product/manager/shop/shop_manager.dart';
import 'package:flutter101/demos/provider_demo_app/core/product/widget/photo_card.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/photos/model/photo_model.dart';
import 'package:provider/provider.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    List<PhotoModel> shopPhotoItems =
        context.watch<ShopManager>().shopPhotoItems;
    return Scaffold(
      body: shopPhotoItems.isEmpty
          ? const Text("Basket is Empty")
          : ListView.builder(
              itemCount: shopPhotoItems.length,
              itemBuilder: (context, index) =>
                  PhotoCard(model: shopPhotoItems[index]),
            ),
    );
  }
}
