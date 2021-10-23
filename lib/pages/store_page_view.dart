import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  final _storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(title: '''Hello!''', backgroundColor: Colors.red),
      StoryItem.pageImage(
          url:
              "https://images.unsplash.com/photo-1541233349642-6e425fe6190e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
          controller: _storyController),
      StoryItem.pageImage(
          url:
              "https://media3.giphy.com/media/5xtDarsUgCwZMXqcVQA/giphy.gif?cid=6c09b952e79a1d945a9a2113a809ed900425bbd30a1865d9&rid=giphy.gif&ct=g",
          controller: _storyController,
          imageFit: BoxFit.contain),
    ];
    return Material(
      child: StoryView(
        storyItems: storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
