import 'package:flutter/material.dart';

class ArticleHeaderImage extends StatelessWidget {
  const ArticleHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/2,
            child: Image.network("https://assets.turbologo.com/blog/en/2019/10/19084952/ferrari-logo-illustration-958x575.jpg"),
          ),
          Container(
            height: MediaQuery.of(context).size.height/2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black])
              ),
          ),
          const Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              "Ferrari has re-launched it's legacy model, the F430. The most beautiful ferrari ever. It is going to cost 10 cr in India",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
      ),
      // child: ShaderMask(
      //   shaderCallback: (Rect bounds) {
      //     return const LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         Colors.transparent,
      //         Colors.black87
      //       ]
      //     ).createShader(bounds);
      //   },
      //   child: Container(
      //     height: MediaQuery.of(context).size.height/2,
      //     color: Colors.blue,
      //     child: Image.network("https://assets.turbologo.com/blog/en/2019/10/19084952/ferrari-logo-illustration-958x575.jpg"),
      //   ),
      // ),
    );
  }
}