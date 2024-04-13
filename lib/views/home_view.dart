import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:memer_app/services/apis.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Memer app"),
        ),
        body: FutureBuilder(
          future: API.getMemes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.custom(
                // itemCount: snapshot.data!.data!.memes!.length,
                // itemBuilder: (context, index) {
                //   final meme = snapshot.data!.data!.memes![index];

                //   return Card(
                //       child: Column(
                //     children: [
                //       CachedNetworkImage(
                //         imageUrl: meme.url!,
                //         fit: BoxFit.contain,
                //         placeholder: (context, url) => const SizedBox.square(
                //             dimension: 20.0,
                //             child: const CircularProgressIndicator()),
                //         errorWidget: (context, url, error) =>
                //             const Icon(Icons.error),
                //       ),
                //     ],
                //   ));
                // },
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  pattern: [
                    WovenGridTile(1),
                    WovenGridTile(
                      5 / 7,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final meme = snapshot.data!.data!.memes![index];

                    return Card(
                        child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: meme.url!,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const SizedBox.square(
                              dimension: 20.0,
                              child: const CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ],
                    ));
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
