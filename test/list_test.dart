import 'package:collection/collection.dart';
import 'package:flutter101/303/generic_learn.dart';
import 'package:flutter101/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test("List best of ", () {
    List<GenericUser> users = [
      GenericUser("vb", "11", 1),
      GenericUser("vb2", "111", 11),
      GenericUser("vb3", "112", 12)
    ];

    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split("").toList());
    }).toList();

    try {
      users.singleWhere(
        (element) => element.findUserName("c"),
        orElse: () {
          return GenericUser("name", "id", 1);
        },
      );
    } on Exception catch (e) {
      print(e);
    }
    print("${users.where((element) => element.money > 5)}");
  });

  test("List best of with collection", () {
    List<GenericUser> users = [
      GenericUser("vb", "11", 10),
      GenericUser("vb2", "111", 11),
      GenericUser("vb3", "112", 12)
    ];

    final response = users.singleWhereOrNull((element) => element.findUserName("x"));
  });
}
