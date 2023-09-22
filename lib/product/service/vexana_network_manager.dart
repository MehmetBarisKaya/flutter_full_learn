import 'package:vexana/vexana.dart';

// ignore: prefer_void_to_null
class VexananetworkManager extends NetworkManager<Null> {
  VexananetworkManager()
      : super(options: BaseOptions(baseUrl: "https://reqres.in/"));
}
