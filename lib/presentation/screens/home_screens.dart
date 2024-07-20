import 'package:bloc_api/logic/cubit/post_cubit/post_cubit.dart';
import 'package:bloc_api/logic/cubit/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc API"),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PostLoadedState) {
              return ListView.builder(
                  itemCount: state.post.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.post[index].title.toString()),
                      subtitle: Text(state.post[index].completed.toString()),
                    );
                  });
            }
            return const Center(
              child: Text("An Errror occure"),
            );
          },
        ),
      ),
    );
  }
}
