import 'package:flutter/material.dart';

class StudioFlow extends StatefulWidget {
  const StudioFlow._();

  static MaterialPage<void> page() => MaterialPage(
        key: ValueKey('studio-flow'),
        child: StudioFlow._(),
      );

  @override
  _StudioFlowState createState() => _StudioFlowState();
}

class _StudioFlowState extends State<StudioFlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Studio page'),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      //   currentIndex: navigationState.selectedIndex,
      //   onTap: (inx) {
      //     navigationState.selectedIndex = inx;
      //   },
      // ),
    );
  }
}
