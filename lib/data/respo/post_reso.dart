
import 'package:bloc_api/data/models/post_model.dart';
import 'package:bloc_api/data/respo/api/api.dart';
import 'package:dio/dio.dart';

class PostRepo {
  API api = API();
  Future<List<PostModel>> featchPost() async {
    try {
      Response response = await api.sendRequest.get("/todos");

      List<dynamic> postMaps = response.data;

      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (e) {
      throw e;
    }
  }
}
