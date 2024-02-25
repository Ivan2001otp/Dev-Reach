import 'package:code_dev_reach/super_models/Author.dart';

import '../../../super_models/Comments.dart';

class BlogPost {
  final String blogPostName;
  final String thumbnailPost;
  final Author author;

  final String postDescription;
  final DateTime created_update_time;
  final List<Comment> commentOfPost;

  BlogPost({
    required this.blogPostName,
    required this.thumbnailPost,
    required this.author,
    required this.postDescription,
    required this.created_update_time,
    required this.commentOfPost,
  });
}
/**
 * name
 * updated date/created date.
 * thumbnail post
 * description.
 * Author of post
 * Comments.
 */