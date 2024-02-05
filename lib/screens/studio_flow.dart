import 'package:flutter/material.dart';
import 'package:flutter_navigation_part_2/state/navigation_state.dart';

class StudioFlow extends StatefulWidget {
  final NavigationState navigationState;

  const StudioFlow({required this.navigationState});

  static MaterialPage<void> page({required NavigationState navigationState}) =>
      MaterialPage(
        key: ValueKey('studio-flow'),
        child: StudioFlow(navigationState: navigationState),
      );

  @override
  _StudioFlowState createState() => _StudioFlowState();
}

class _StudioFlowState extends State<StudioFlow> {
  @override
  Widget build(BuildContext context) {
    var navigationState = widget.navigationState;
    return Scaffold(
      body: Center(
        child: Text('Studio page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: navigationState.selectedIndex,
        onTap: (inx) {
          navigationState.selectedIndex = inx;
        },
      ),
    );
  }
}
