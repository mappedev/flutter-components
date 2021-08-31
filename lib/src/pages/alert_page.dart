import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          onPressed: () => _showAlert(context),
          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text('Título'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Este es el contenido de la caja de alerta.'),
            SizedBox(height: 16.0),
            FlutterLogo(
              size: 100.0,
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok'),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
