import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_page.dart';
import 'post_states.dart';

class PostComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(LoadPost()),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const SizedBox(
              width: 350.0, // Adjust these values to suit your needs
              height: 350.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is PostLoaded || state is PostLiked || state is PostUnliked) {
            final post = (state is PostLoaded) ? state.post : (state is PostLiked) ? state.post : (state as PostUnliked).post;
            final isLiked = state is PostLiked;
            return GestureDetector(
              onDoubleTap: () => isLiked ? context.read<PostBloc>().add(UnlikePost()) : context.read<PostBloc>().add(LikePost()),
              child: Card(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(post.authorImageUrl),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.authorName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Text(post.postLocation, style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            icon: const Icon(Icons.menu_open),
                            onPressed: () {
                              final postBloc = context.read<PostBloc>();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Hide Post'),
                                    content: const Text('Are you sure you want to hide this post?'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Hide'),
                                        onPressed: () {
                                          postBloc.add(HidePost());
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostPage(
                                author: post.authorName,
                                postLocation: post.postLocation,
                                description: post.postDescription,
                                authorImageUrl: post.authorImageUrl,
                                postImageUrl: post.postImageUrl,
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(post.postImageUrl),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(post.postDescription),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.thumb_up, color: isLiked ? Colors.red : Colors.grey),
                                onPressed: () => isLiked ? context.read<PostBloc>().add(UnlikePost()) : context.read<PostBloc>().add(LikePost()),
                              ),
                              const SizedBox(width: 4),
                              Text('${post.likeCount}'),
                              const SizedBox(width: 16),
                              const Icon(Icons.comment),
                              const SizedBox(width: 4),
                              Text('${post.commentCount}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is PostHidden) {
            return const SizedBox(
              width: 350.0, // Adjust these values to suit your needs
              height: 350.0,
              child: Center(
                child: Text('Post is hidden'),
              ),
            );
          } else {
            return const Text('Error loading post');
          }
        },
      ),
    );
  }
}