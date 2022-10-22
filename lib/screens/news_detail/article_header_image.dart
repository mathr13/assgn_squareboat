import 'package:flutter/material.dart';

class ArticleHeaderImage extends StatelessWidget {

  final String imageUrl;
  final String title;

  const ArticleHeaderImage({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/2,
            child: Image.network(imageUrl),
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
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
      ),
    );
  }
}