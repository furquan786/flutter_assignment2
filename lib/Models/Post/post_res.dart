import 'dart:convert';
import 'post.dart';

class PostResponse {
  final List<Post> posts;
  final int total;
  final int skip;
  final int limit;

  PostResponse({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory PostResponse.fromJson(String source) {
    final Map<String, dynamic> json = jsonDecode(source);
    return PostResponse(
      posts: (json['posts'] as List).map((e) => Post.fromJson(e)).toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
