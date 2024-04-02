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
  final authorNames = [
    'Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Hannah', 'Isaac', 'Julia'
  ];
  final postLocations = [
    'New York', 'Los Angeles', 'London', 'Tokyo', 'Paris', 'Sydney', 'Berlin', 'Toronto', 'Seoul', 'Mumbai'
  ];
  final postDescriptions = [
    'Exploring the wilderness', 'Capturing city lights', 'Adventures in nature', 'Foodie delights', 'Urban street art'
  ];
  final imageUrls = [
    'https://queticosuperior.org/wp-content/uploads/2023/12/TNWR-Lynx-Project-2020.jpg',
    'https://senecaparkzoo.org/wp-content/uploads/2022/07/Lynx_Seneca-Park-Zoo-Programs-04-18-2022-By-Sean-Maciejewski-5-of-12-scaled.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Cat_August_2010-4.jpg/1200px-Cat_August_2010-4.jpg',
    'https://static.scientificamerican.com/sciam/cache/file/2AE14CDD-1265-470C-9B15F49024186C10_source.jpg?w=1200',
    'https://www.wfla.com/wp-content/uploads/sites/71/2023/05/GettyImages-1389862392.jpg?w=2560&h=1440&crop=1',
    'https://hips.hearstapps.com/hmg-prod/images/cat-instagram-captions-64ff2dfa47e9a.jpg?crop=1xw:0.84375xh;center,top',
    'https://www.pdinsurance.co.nz/wp-content/uploads/2023/02/Where-do-Pallas-cats-live-02-nz.jpg',
    'https://external-preview.redd.it/bK_8MUe7k7fYKkV6dNOlT0uF8t87tTjGjD9hyN4rFaQ.jpg?auto=webp&s=ad03101063adf9eb45fc9090eb57945306a4708b',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjlbgXd58xu4KIcp-ZIm762ctT0Ps3DDNrnZ1CREMZYMTsmN0iFUNzUig-vvj9L9h64s8&usqp=CAU',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cat_November_2010-1a.jpg/640px-Cat_November_2010-1a.jpg',
    'https://cdn.theatlantic.com/media/img/photo/2015/03/aoshima-japans-cat-island/c01_RTR4RUGT-1/original.jpg',
    'https://www.catster.com/wp-content/uploads/2023/11/Cat-in-Japan-Pabkov-Shutterstock.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp57S_X0Yb2sXnPSFNmiT4QfLpj5gKFAuyIk2_rBhrqw&s',
    'https://web-japan.org/nipponia/nipponia26/images/animal/25_1.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsjR1MkdsF89WrLj8FOoyWt0xDKzm-Ghau_36hOhJQkg&s',
    'https://preview.redd.it/4v3kmhe9re061.jpg?width=1080&crop=smart&auto=webp&s=ca1c21cc6038cae64b4cf6a8a3392eda8eb4bf24',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbSSxbv14WnPuA7LjeDH4V-4LMxp332RKRlj1nQ5k_Bg&s',
  ];

  // Randomly select values from the dictionaries
  final random = Random();
  final authorName = authorNames[random.nextInt(authorNames.length)];
  final postLocation = postLocations[random.nextInt(postLocations.length)];
  final postDescription = postDescriptions[random.nextInt(postDescriptions.length)];
  final postImageUrl = imageUrls[random.nextInt(imageUrls.length)];
  final authorImageUrl = imageUrls[random.nextInt(imageUrls.length)];
  final likeCount = random.nextInt(50000);
  final commentCount = random.nextInt(5000);

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
