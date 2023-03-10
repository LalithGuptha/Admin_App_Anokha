import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:admin_app/screens/HomeScreen/slidableCards.dart';
class ButtonContainer extends StatefulWidget {
  const ButtonContainer({Key? key}) : super(key: key);

  @override
  _ButtonContainerState createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _contents = [
    {'text': 'Content for Day 1',
      'card': ['Card 1 for Day 1','Card 2 for Day 1','Card 3 for Day 1','Card 4 for Day 1'],
    },
    { 'text': 'Content for Day 2',
      'card': ['Card 1 for Day 2','Card 2 for Day 2','Card 2 for Day 2','Card 4 for Day 2'],
    },
    {
      'text': 'Content for Day 3',
      'card': ['Card 1 for Day 3','Card 2 for Day 3','Card 3 for Day 3','Card 4 for Day 3'],
    },
];
final List<List<Map<String,String>>> _cards = [
    [
      {'image':'assets/temp/anokha20_5.png',
        'name':'Event Name 5'},
      {'image':'assets/temp/anokha20_1.png',
      'name':'Event Name 1'},
      {'image':'assets/temp/anokha20_2.png',
      'name':'Event Name 2'},
      {'image':'assets/temp/anokha20_3.png',
      'name': 'Event Name 3'}],
    [
      {'image':'assets/temp/anokha20_4.png',
      'name':'Event Name 4'},
      {'image':'assets/temp/anokha20_3.png',
       'name': 'Event Name 3'},
      {'image':'assets/temp/anokha20_2.png',
        'name':'Event Name 2'},
      {'image':'assets/temp/anokha20_1.png',
        'name':'Event Name 1'}],
    [
      {'image':'assets/temp/anokha20_5.png',
        'name':'Event Name 5'},
      {'image':'assets/temp/anokha20_2.png',
      'name':'Event Name 2'},
      {'image':'assets/temp/anokha20_3.png',
      'name': 'Event Name 3'},
      {'image':'assets/temp/anokha20_5.png',
        'name':'Event Name 5'}],
  ];
  final blue="002845";
  final white="FFFFFC";
  final grey="BEB7A4";
  final orange="FF7F11";
  final red="FF3F00";
  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildButton(int index) {
    return Expanded(
      child: TextButton(
        onPressed: () => _onButtonPressed(index),
        style: TextButton.styleFrom(
          backgroundColor:
          _selectedIndex == index ? HexColor(orange) : HexColor(grey),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Day ${index + 1}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     spreadRadius: 2,
        //     blurRadius: 4,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   _contents[_selectedIndex]['text'],
          //   style: TextStyle(fontSize: 18),
          // ),
          //SizedBox(height: 16),
          AutomaticSlidableCardsList(items: _cards[_selectedIndex]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(0),
            SizedBox(width: 16),
            _buildButton(1),
            SizedBox(width: 16),
            _buildButton(2),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: _buildContent(),
        ),
      ],
    );
  }
}
