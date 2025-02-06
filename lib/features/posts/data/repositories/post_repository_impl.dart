import 'package:clean_architecture_posts_app/core/error/exception.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/core/network/network_info.dart';
import 'package:clean_architecture_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecture_posts_app/features/posts/data/models/post_model.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import '../datasources/post_remote_data_source.dart';

typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
    // TODO: implement getAllPosts
    if(await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
       return Left(ServerFailure());
    }
    } else {
      try {
        final localPosts =  await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }

    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async{
    // TODO: implement addPost
    final postModel = PostModel(id: post.id, title: post.title, body: post.body);
  /* if(await networkInfo.isConnected) {
     try {
       await  remoteDataSource.addPost(postModel);
       return Right(unit);
     } on ServerException {
       return Left(ServerFailure());
     }

   } else {
     return Left(OfflineFailure());
   }*/
    return await _getMessage(() {
        return  remoteDataSource.addPost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async{
    // TODO: implement deletePost
   /* if( await networkInfo.isConnected) {
      try {
        await  remoteDataSource.deletePost(id);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }

    } else {
      return Left(OfflineFailure());
    }*/
    return  await _getMessage(() {
      return remoteDataSource.deletePost(id);
    });

  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    // TODO: implement updatePost
    final postModel = PostModel(id: post.id, title: post.title, body: post.body);
   /* if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updatePost(postModel);
        return Right(unit);

      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }*/
   return await  _getMessage(() {
      return remoteDataSource.updatePost(postModel);
    }
    );

  }

  Future<Either<Failure, Unit>> _getMessage(DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if( await networkInfo.isConnected) {
      try {
        await  deleteOrUpdateOrAddPost();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }

    } else {
      return Left(OfflineFailure());
    }
  }
}
