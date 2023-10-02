import 'package:flutter/material.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/photos/model/photo_model.dart';
import 'package:logger/logger.dart';

class ShopManager extends ChangeNotifier {
  List<PhotoModel> shopPhotoItems = [];

  double totalMoney = 0;

  void sumtotalMoney() {
    totalMoney = shopPhotoItems.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.count);
    notifyListeners();
  }

  void addShopItems(PhotoModel photoModel) {
    photoModel.count++;
    shopPhotoItems.add(photoModel);
    sumtotalMoney();
    notifyListeners();
  }

  void removeShopItems(PhotoModel photoModel) {
    photoModel.count--;
    shopPhotoItems.remove(photoModel);
    sumtotalMoney();
    notifyListeners();
  }

  void incrementItem(PhotoModel photoModel) {
    if (!shopPhotoItems.contains(photoModel)) {
      Logger().f("Items not found!");
    } else {
      shopPhotoItems
          .singleWhere((element) => element.id == photoModel.id)
          .count++;
      sumtotalMoney();
    }
    notifyListeners();
  }

  void deIncrementItem(PhotoModel photoModel) {
    if (!shopPhotoItems.contains(photoModel)) {
      Logger().f("Items not found!");
    } else {
      shopPhotoItems
          .singleWhere((element) => element.id == photoModel.id)
          .count--;
      sumtotalMoney();
    }
    notifyListeners();
  }
}
