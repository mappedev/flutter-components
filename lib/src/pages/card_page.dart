import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final double _elevation = 1.5;
  // final double _borderRadius = 8.0;
  final BorderRadius _borderRadius = BorderRadius.circular(8.0);
  final double _spaceBetweenCards = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(_spaceBetweenCards),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: _spaceBetweenCards),
          _cardType2(),
          SizedBox(height: _spaceBetweenCards),
          _cardType1(),
          SizedBox(height: _spaceBetweenCards),
          _cardType2(),
          SizedBox(height: _spaceBetweenCards),
          _cardType1(),
          SizedBox(height: _spaceBetweenCards),
          _cardType2(),
          SizedBox(height: _spaceBetweenCards),
          _cardType1(),
          SizedBox(height: _spaceBetweenCards),
          _cardType2(),
          SizedBox(height: _spaceBetweenCards),
          _cardType1(),
          SizedBox(height: _spaceBetweenCards),
          _cardType2(),
          SizedBox(height: _spaceBetweenCards),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: _elevation,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text(
                'Aquí estamos con la descripción de la tarjeta que queremos ver para tener una idea de que nos quiere mostrar Fernando Herrera.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: _elevation,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://photographylife.com/wp-content/uploads/2020/03/Dan-Ballard-Landscapes-6.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://photographylife.com/wp-content/uploads/2020/03/Dan-Ballard-Landscapes-6.jpg'),
          // ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              'Descripción de la imagen.',
            ),
          )
        ],
      ),
    );
  }
}
