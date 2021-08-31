import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 36.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      // divisions: 20,
      label: 'Tamaño de la imagen',
      value: _sliderValue,
      min: 100.0,
      max: MediaQuery.of(context).size.width,
      onChanged: !_isChecked
          ? (newValue) {
              setState(() => _sliderValue = newValue);
            }
          : null,
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //   value: _isChecked,
    //   onChanged: (value) {
    //     if (value != null) {
    //       setState(() {
    //         _isChecked = value;
    //       });
    //     }
    //   },
    // );

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _isChecked,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _isChecked = value;
          });
        }
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value;
        });
      },
    );
  }

  Widget _createImage() {
    return FadeInImage(
      width: _sliderValue,
      height: _sliderValue,
      fit: BoxFit.contain,
      fadeInDuration: Duration(milliseconds: 200),
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage(
        'https://camo.githubusercontent.com/40bbb4fa3fcd67e208bd8cb6a35cd1175fe87568a8b364765218ea54c4640851/687474703a2f2f692e696d6775722e636f6d2f716a65596271582e706e67',
      ),
    );
  }
}
