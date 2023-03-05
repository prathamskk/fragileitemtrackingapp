import 'package:flutter/material.dart';

// class MyAppBar extends StatelessWidget {
//   const MyAppBar({required this.title, super.key});
//
//   // Fields in a Widget subclass are always marked "final".
//
//   final Widget title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.0, // in logical pixels
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(color: Colors.blue[500]),
//       // Row is a horizontal, linear layout.
//       child: Row(
//         children: [
//           const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null, // null disables the button
//           ),
//           // Expanded expands its child
//           // to fill the available space.
//           Expanded(
//             child: title,
//           ),
//           const IconButton(
//             icon: Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyScaffold extends StatelessWidget {
//   @override
//
//   const MyScaffold({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Material is a conceptual piece
//     // of paper on which the UI appears.
//     return Material(
//       // Column is a vertical, linear layout.
//       child: Column(
//         children: [
//           MyAppBar(
//             title: Text(
//               'Example title',
//               style: Theme.of(context) //
//                   .primaryTextTheme
//                   .titleLarge,
//             ),
//           ),
//           const Expanded(
//             child: Center(
//               child: Text('Hello, world!'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar();

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Flutter BottomNavigationBar Example'),
          backgroundColor: Colors.green
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',

              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}