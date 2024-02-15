class SavedPostModel {
  final String mainTitle;
  final String mainCategory;
  final String subCategory;

  final DateTime? postedDate;
  final String authorImgUrl;
  final String authorName;

  SavedPostModel({
    required this.mainCategory,
    required this.mainTitle,
    required this.subCategory,
    required this.postedDate,
    required this.authorImgUrl,
    required this.authorName,
  });

  //from json

  //to json
  Map<String, dynamic> toJson() {
    return {
      "mainTitle": this.mainTitle,
      "mainCategory": mainCategory,
      "subCategory": subCategory,
      "postedDate": postedDate,
      "authorImgUrl": authorImgUrl,
      "authorName": authorName,
    };
  }
}
