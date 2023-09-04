import 'package:flutter/material.dart';
import 'package:flutter101/202/model/model_learn.dart';

class ModelLearn extends StatefulWidget {
  const ModelLearn({super.key});

  @override
  State<ModelLearn> createState() => _ModelLearnState();
}

class _ModelLearnState extends State<ModelLearn> {
  var user9 = PostModel7(body: "a");

  @override
  void initState() {
    super.initState();

    final user1 = PostModel11()
      ..userId = 1
      ..body = "bk";
    user1.body = "mbk";

    final user2 = PostModel1(1, 1, "a", "b");
    user2.body = "bk";

    final user3 = PostModel2(1, 2, "a", "b");
    //user3.body = "a";

    final user4 = PostModel3(userId: 1, id: 2, title: "a", body: "g");

    final user5 = PostModel4(userId: 1, id: 3, title: "title", body: "body");

    final user6 = PostModel5(userId: 1, id: 2, title: "title", body: "body");

    final user7 = PostModel6();
    //serv,ce
    final user8 = PostModel7(body: "a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: "vb");
            user9.updateBody("vel");
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.title ?? "Not has any data "),
      ),
    );
  }
}
