import 'package:bloc_api/data/models/post_model.dart';
import 'package:bloc_api/data/respo/post_reso.dart';
import 'package:bloc_api/logic/cubit/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) { 
    featchPost();
  }
  PostRepo postRepo = PostRepo();
  void featchPost() async {
    try {
      List<PostModel> post = await postRepo.featchPost();
      emit(PostLoadedState(post: post));
    } catch (e) {
      emit(PostErrorState(error: e.toString()));
    }
  }
}
