import 'package:flutter/material.dart';

import 'constants/constant_values.dart';
import 'utilities/utility_values.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesHomeApp(),
    );
  }
}

class NotesHomeApp extends StatefulWidget {
  const NotesHomeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotesHomeAppState();
  }
}

class _NotesHomeAppState extends State<NotesHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SBColours.secondaryBckgLight,
      appBar: AppBar(
        backgroundColor: SBColours.primaryBckgLight,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "MyNEWS",
              style: SBTextStyles.titleLight1,
              ),
            Column(
              children: [
                const Text(
                  "LOCATION",
                  style: SBTextStyles.titleLight2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      size: SBSizes.primaryIconSize,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "India",
                      style: SBTextStyles.titleLight3,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ).wrapWidgetWithPadding(SBPaddings.bottomPadding3),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SBSearchBar(),
          const TitleLayer().wrapWidgetWithPadding(SBPaddings.verticalPadding1),
          Expanded(
            child: ListView(
              children: [1,2,3,4,5].map((e) => const NewsCard()).toList(),
            )
          ),
        ],
      ).wrapWidgetWithPadding(SBPaddings.padding1),
    );
  }
}


class SBSearchBar extends StatelessWidget {
  const SBSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: SBRadiuses.borderRadius2,
        color: SBColours.secondaryBckgDark,
      ),
      padding: SBPaddings.horizontalPadding2,
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for news, topics..",
          suffixIcon: Icon(Icons.search, color: SBColours.primaryBckgDark,),
          contentPadding: SBPaddings.verticalPadding2
        ),
      ),
    );
  }
}

class TitleLayer extends StatelessWidget {
  const TitleLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Top Headlines",
          style: SBTextStyles.headline1,
        ),
        Row(
          children: const [
            Text(
              "Sort: ",
              style: SBTextStyles.content4,
            ),
            Text(
              "Newest",
              style: SBTextStyles.content3,
            ),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: SBColours.primaryBckgDark,
            ),
          ],
        ),
      ],
    );
  }
}


class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 0.05,
          ),
        ],
        borderRadius: SBRadiuses.borderRadius3
      ),
      margin: SBPaddings.horizontalPadding5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "NewsSource",
                  style: SBTextStyles.content1,
                ),
                Spacer(),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet sapien ac turpis vulputate egestas sit amet in diam. Vivamus orci ex, convallis non velit id, tristique aliquam nisi. Sed sed nisi faucibus tellus facilisis euismod non quis lacus. Donec congue dignissim dui ac imperdiet. Ut eu enim ligula. Duis et neque nisi. Etiam dignissim nulla id neque laoreet rhoncus.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: SBTextStyles.content2,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  "10 min ago",
                  style: SBTextStyles.content4,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: double.maxFinite,
              decoration: const BoxDecoration(
                color: SBColours.primaryBckgDark,
                borderRadius: SBRadiuses.borderRadius3
              ),
            ),
          ).wrapWidgetWithPadding(SBPaddings.leftPadding2),
        ],
      ).wrapWidgetWithPadding(SBPaddings.padding2),
    ).wrapWidgetWithPadding(SBPaddings.verticalPadding3);
  }
}