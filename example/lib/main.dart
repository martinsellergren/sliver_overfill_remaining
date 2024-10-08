import 'package:flutter/material.dart';
import 'package:sliver_overfill_remaining/sliver_overfill_remaining.dart';

const sliverAppBarExpandedHeight = 300.0;
const sliverAppBarToolbarHeight = kToolbarHeight;
const sliverAppBarTabBarHeight = 50.0;
double get sliverAppBarFlexDelta =>
    sliverAppBarExpandedHeight -
    sliverAppBarToolbarHeight -
    sliverAppBarTabBarHeight;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: CustomScrollView(
        slivers: [
          const _SliverAppBar(),
          SliverOverfillRemaining(
            extraHeight: sliverAppBarFlexDelta,
            child: const Placeholder(),
          ),
        ],
      ),
    ),
  ));
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar();

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      floating: false,
      title: Text('sliver_overfill_remaining example'),
      backgroundColor: Colors.orange,
      toolbarHeight: sliverAppBarToolbarHeight,
      expandedHeight: sliverAppBarExpandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Placeholder(),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(sliverAppBarTabBarHeight),
        child: DefaultTabController(
          length: 1,
          child: TabBar(
            tabs: [
              Tab(
                text: 'This is the bottom tab bar',
              )
            ],
          ),
        ),
      ),
    );
  }
}
