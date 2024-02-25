import 'package:code_dev_reach/Constant/file.url.dart';
import 'package:code_dev_reach/Features/Home/Model/Post.dart';
import 'package:code_dev_reach/super_models/Author.dart';

class Technology {
  Technology();
  List<BlogPost> l1 = [
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1,
    bp1
  ];
}

BlogPost bp1 = BlogPost(
  blogPostName:
      'How can you better in logic Building in the field of programming...',
  thumbnailPost: Constant.imgJpeg3,
  author: a1,
  postDescription: 'This is post descriptoin',
  created_update_time: DateTime.now(),
  commentOfPost: [],
);

Author a1 = Author(
  firstName: 'Karl',
  lastName: 'Ben',
  email: 'KarlBen2001@gmail.com',
  socialMediaLinks: [],
  aboutAuthor: 'I am a good author',
  rating: 'Best',
);
/*
 */