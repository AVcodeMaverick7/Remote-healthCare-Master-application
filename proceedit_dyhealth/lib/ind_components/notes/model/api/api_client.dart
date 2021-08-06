
import 'package:proceedit_dyhealth/ind_components/notes/model/dto/info_item.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://5ee7632bffee0c0016a121e0.mockapi.io/api/v1/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/info")
  Future<List<InfoItem>> getInfo();
}