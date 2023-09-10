class UserMenagement<T extends AdminUser> {
  final T admin;

  UserMenagement(this.admin);

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculatemoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney =
        users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);
    return sumMoney;
  }

  Iterable<BKModel<R>>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => BKModel(e.name.split("").toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class BKModel<T> {
  final String name = "bk";
  final List<T> items;

  BKModel(this.items);
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() {
    return "GenericUser(name: $name,id: $id,money: $money)";
  }
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
