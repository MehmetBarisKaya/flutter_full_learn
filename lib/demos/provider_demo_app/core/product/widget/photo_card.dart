// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter101/demos/provider_demo_app/core/product/manager/shop/shop_manager.dart';

import 'package:flutter101/demos/provider_demo_app/feauture/photos/model/photo_model.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class PhotoCard extends StatefulWidget {
  final PhotoModel model;
  const PhotoCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard>
    with AutomaticKeepAliveClientMixin {
  bool isIncrementOpen = false;
  late PhotoModel photoModel;
  @override
  void initState() {
    super.initState();
    photoModel = widget.model;
  }

  void isIncrementChange() {
    if (!isIncrementOpen) {
      context.read<ShopManager>().addShopItems(photoModel);
    } else {
      context.read<ShopManager>().removeShopItems(photoModel);
    }
    setState(() {
      isIncrementOpen = !isIncrementOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Stack(
        children: [
          buildListTile(),
          Positioned(
            right: 0,
            child: buildCardShopIncAndDec(),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile() {
    return ListTile(
      title: Image.network(photoModel.url ?? ""),
      subtitle: Column(
        children: [
          Text(
            photoModel.title ?? "",
            maxLines: 1,
          ),
          IconButton(
              onPressed: isIncrementChange,
              icon: const Icon(Icons.shopping_basket))
        ],
      ),
    );
  }

  Widget buildCardShopIncAndDec() {
    return AnimatedContainer(
      duration: context.duration.durationLow,
      height: isIncrementOpen ? context.sized.dynamicHeight(0.13) : 0,
      width: isIncrementOpen ? context.sized.dynamicWidth(0.1) : 0,
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Expanded(flex: 4, child: buildIconButtonIncrement()),
            Expanded(child: Text(photoModel.count.toString())),
            Expanded(flex: 4, child: buildIconButtonRemove()),
          ],
        ),
      ),
    );
  }

  IconButton buildIconButtonIncrement() {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          context.read<ShopManager>().incrementItem(photoModel);
        },
        icon: const Icon(Icons.add));
  }

  IconButton buildIconButtonRemove() {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          context.read<ShopManager>().deIncrementItem(photoModel);
        },
        icon: const Icon(Icons.remove));
  }

  @override
  bool get wantKeepAlive => true;
}
