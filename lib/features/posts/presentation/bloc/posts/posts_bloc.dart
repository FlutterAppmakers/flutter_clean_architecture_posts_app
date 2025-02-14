import 'package:bloc/bloc.dart';
import 'package:clean_architecture_posts_app/core/strings/failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/usecases/get_all_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;
  PostsBloc({required this.getAllPosts}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is GetAllPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPosts = await getAllPosts();
        emit(mapFailureOrPostsToState(failureOrPosts));

      } else if(event is RefreshPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPosts = await getAllPosts();
         emit(mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    print("failure ${failure.runtimeType}");
    switch(failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }

  }

  PostsState mapFailureOrPostsToState (Either <Failure, List<Post>> either) {
   return either.fold(
            (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
            (posts) => LoadedPostsState(posts: posts),
    );

  }
}
