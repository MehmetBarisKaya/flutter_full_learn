import 'package:dio/dio.dart';
import 'package:flutter101/303/reqres_resources/service/reqres_service.dart';
import 'package:flutter101/303/reqres_resources/viewModel/reqres_provider.dart';
import 'package:flutter101/product/global/resource_context.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ReqResProvider])
void main() {
  setUp(() {});

  test("saveToLocale - test", () {
    final mockReqResProvider = ReqResProvider(ReqResService(Dio()));
    final resourceContext = ResourceContext();
    final result = mockReqResProvider.saveToLocal(resourceContext, []);
    expect(result, []);
  });
}
