import 'package:flutter101/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test("User Calculate", () {
    final users = [
      GenericUser("vb", "11", 10),
      GenericUser("vb2", "111", 11),
      GenericUser("vb3", "112", 12),
    ];

    final userManagement = UserMenagement(AdminUser("bk", "1", 11, 1));
    final result = UserMenagement(AdminUser("bk", "1", 11, 1)).calculatemoney(users);
    final response = userManagement.showNames(users);
    expect(response, 133);
  });
}
