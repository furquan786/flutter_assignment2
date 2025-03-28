import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String body;
  final List<String> tags;
  final int reactions;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      tags: List<String>.from(json['tags']),
      reactions: json['reactions'],
    );
  }
}

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
