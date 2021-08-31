import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPage createState() => _AnimatedContainerPage();
}

class _AnimatedContainerPage extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.cyan;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  int _milliseconds = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: _milliseconds),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color,
            ),
          ),
        ),
      ),
      floatingActionButton: _floatingActionButtons(),
    );
  }

  Widget _floatingActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 38.0),
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.remove),
          onPressed: _increaseSpeed,
        ),
        SizedBox(width: 4.0),
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.add),
          onPressed: _decreaseSpeed,
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          heroTag: null,
          child: Icon(Icons.play_arrow),
          onPressed: _changeForm,
        ),
      ],
    );
  }

  void _decreaseSpeed() {
    if (_milliseconds > 100) {
      _milliseconds -= 100;
    }
  }

  void _increaseSpeed() {
    if (_milliseconds < 1000) {
      _milliseconds += 100;
    }
  }

  void _changeForm() {
    final random = Random();

    setState(() {
      _width = random.nextInt(240).toDouble();
      _height = random.nextInt(240).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1.0,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(96).toDouble());
    });
  }
}
