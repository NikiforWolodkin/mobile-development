import 'dart:math';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post.dart';

// Define our PostEvent
abstract class PostEvent {}

class LoadPost extends PostEvent {}

class LikePost extends PostEvent {}

class UnlikePost extends PostEvent {} // New event for unliking a post

class HidePost extends PostEvent {} // New event for hiding a post

// Define our PostState
abstract class PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final Post post;

  PostLoaded({required this.post});
}

class PostLiked extends PostState {
  final Post post;

  PostLiked({required this.post});
}

class PostUnliked extends PostState { // New state for when a post is unliked
  final Post post;

  PostUnliked({required this.post});
}

class PostHidden extends PostState {} // New state for when a post is hidden

class PostError extends PostState {}



class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoading());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadPost) {
      yield PostLoading();
      try {
        // Fetch the post data here
        final Post post = await fetchPost();
        yield PostLoaded(post: post);
      } catch (_) {
        yield PostError();
      }
    } else if (event is LikePost || event is UnlikePost) {
      final currentState = state;
      if (currentState is PostLoaded || currentState is PostLiked || currentState is PostUnliked) {
        final currentPost = (currentState as dynamic).post;
        final likedPost = currentPost.copyWith(likeCount: currentPost.likeCount + (event is LikePost ? 1 : -1));
        yield event is LikePost ? PostLiked(post: likedPost) : PostUnliked(post: likedPost);
      }
    } else if (event is HidePost) {
      yield PostHidden();
    }
  }
}




Future<Post> fetchPost() async {
  // Simulate network delay
  await Future.delayed(Duration(milliseconds: 400 + Random().nextInt(2500)));

  // Generate random data
  final authorName = 'Author ${Random().nextInt(100)}';
  final postLocation = 'Location ${Random().nextInt(100)}';
  final postDescription = 'Description ${Random().nextInt(100)}';
  const postImageUrl = 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479';
  const authorImageUrl = 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479';
  final likeCount = Random().nextInt(50000);
  final commentCount = Random().nextInt(5000);

  // Return a new Post
  return Post(
    authorName: authorName,
    postLocation: postLocation,
    postDescription: postDescription,
    postImageUrl: postImageUrl,
    authorImageUrl: authorImageUrl,
    likeCount: likeCount,
    commentCount: commentCount,
  );
}
