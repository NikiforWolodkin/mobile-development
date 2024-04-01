class Post {
  final String authorName;
  final String postLocation;
  final String postDescription;
  final String postImageUrl;
  final String authorImageUrl;
  final int likeCount;
  final int commentCount;

  Post({
    required this.authorName,
    required this.postLocation,
    required this.postDescription,
    required this.postImageUrl,
    required this.authorImageUrl,
    required this.likeCount,
    required this.commentCount,
  });

  Post copyWith({
    String? authorName,
    String? postLocation,
    String? postDescription,
    String? postImageUrl,
    String? authorImageUrl,
    int? likeCount,
    int? commentCount,
  }) {
    return Post(
      authorName: authorName ?? this.authorName,
      postLocation: postLocation ?? this.postLocation,
      postDescription: postDescription ?? this.postDescription,
      postImageUrl: postImageUrl ?? this.postImageUrl,
      authorImageUrl: authorImageUrl ?? this.authorImageUrl,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
    );
  }
}
