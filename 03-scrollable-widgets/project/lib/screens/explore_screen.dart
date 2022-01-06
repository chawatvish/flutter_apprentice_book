import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              scrollDirection: Axis.vertical,
              controller: _controller,
              children: [
                TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
                const SizedBox(height: 16),
                FriendPostLiveView(
                    friendPosts: snapshot.data?.friendPosts ?? []),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  void _scrollListener() {
    final _outOfRangePosition = _controller.position.outOfRange;
    final _maxPosition = _controller.position.maxScrollExtent;
    final _minPosition = _controller.position.minScrollExtent;
    final _currentOffset = _controller.offset;

    if (_currentOffset == _maxPosition && !_outOfRangePosition) {
      print('i am at the bottom!');
    } else if (_currentOffset == _minPosition && !_outOfRangePosition) {
      print('i am at the top!');
    } else {
      //DO NOT THING
    }
  }
}
