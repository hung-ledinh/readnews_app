import 'package:readnews_app/read_news/read_news_json.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/posts")
  Future<List<ReadNewsEntity>> getNewPosts();

  @GET("/posts/{id}")
  Future<ReadNewsEntity> getNewPostDetail(@Path("id") int id);

  @DELETE("/posts/{id}")
  Future<ReadNewsEntity> deleteNewPost(@Path("id") int id);

  @POST("/posts")
  Future<ReadNewsEntity> createNewPost(@Body() ReadNewsEntity readNewsEntity);

  @PUT("/posts/{id}")
  Future<ReadNewsEntity> updateNewPost(
      @Path() String id, @Body() ReadNewsEntity readNewsEntity);
}
