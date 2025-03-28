import 'package:http/http.dart' as http;
import 'package:new_assignment/Models/Post/post.dart';

class PostRepository {
  Future<PostResponse> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/posts/search?q=love'));

    if (response.statusCode == 200) {
      return PostResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
