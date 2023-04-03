
import 'package:http_app/post_repository.dart';

void main() async {
  PostRepository postRepository = PostRepository();
  await postRepository. findByIdV1(1);
}