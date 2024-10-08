import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverOverfillRemaining extends StatelessWidget {
  final double extraHeight;
  final Widget? child;

  const SliverOverfillRemaining(
      {super.key, required this.extraHeight, this.child});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        if (child != null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: child,
          ),
        _Spacer(extraHeight: extraHeight)
      ],
    );
  }
}

class _Spacer extends StatelessWidget {
  final double extraHeight;

  const _Spacer({required this.extraHeight});

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        var height = constraints.viewportMainAxisExtent -
            constraints.precedingScrollExtent +
            extraHeight;
        if (height < 0) height = 0;
        return SliverToBoxAdapter(child: SizedBox(height: height));
      },
    );
  }
}
