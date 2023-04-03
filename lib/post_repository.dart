
import 'package:dio/dio.dart';

class PostRepository {
  final dio = Dio();
  
  Future<void> findByIdV1(int id) async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    print(response.data);
  }
}