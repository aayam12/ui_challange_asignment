import 'package:flutter/material.dart';
import 'package:ui_challenge/block_deal_body.dart';
import 'package:ui_challenge/bulk_deal_body.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.amber,
          tabs: [
            Tab(
              child: Text(
                'Bulk Deal',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Tab(
              child: Text(
                'Block Deal',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            BulkDeal(),
            BlockDeal(),
          ],
        ),
      ),
    );
  }
}
