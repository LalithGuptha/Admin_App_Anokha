import 'dart:ffi';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:hexcolor/hexcolor.dart';

class AutomaticSlidableCardsList extends StatefulWidget {
  final List<Map<String, String>> items;

  AutomaticSlidableCardsList({required this.items});

  @override
  _AutomaticSlidableCardsListState createState() =>
      _AutomaticSlidableCardsListState();
}

class _AutomaticSlidableCardsListState
    extends State<AutomaticSlidableCardsList> {
  int _currentPage = 0;
  final PageController _pageController =
      PageController(viewportFraction: 0.8, keepPage: false);
  late Timer _timer;
  final blue = "002845";
  final white = "FFFFFC";
  final grey = "BEB7A4";
  final orange = "FF7F11";
  final red = "FF3F00";

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      final int nextIndex =
          _currentPage == widget.items.length - 1 ? 0 : _currentPage + 1;
      _pageController.animateToPage(
        nextIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          bool active = index == _currentPage;
          return _buildCard(widget.items[index], active);
        },
      ),
    );
  }

  Widget _buildCard(Map<String, String> text, bool active) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      // decoration: BoxDecoration(
      //   // color: active ? Colors.blue : Colors.grey,
      //   borderRadius: BorderRadius.circular(10),
      // ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white70,
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            child: FittedBox(
              child: Image.asset(text['image']!),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Center(
              child: Text(
                text['name']!,
                style: (TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
