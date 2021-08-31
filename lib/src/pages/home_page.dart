import 'package:flutter/material.dart';

// import 'package:components/src/pages/alert_page.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        centerTitle: true,
      ),
      body: _list(),
    );
  }

  Widget _list() {
    // Lo siguiente no es valido porque bloqueará la UI hasta que se resuelva.
    // menuProvider.fetchData().then((options) {
    //   print('_lista');
    //   print(options);
    // });

    return FutureBuilder(
      future: menuProvider.fetchData(),
      // initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Ha ocurrido un error: ${snapshot.error}'),
            );
          }

          final List<dynamic>? data = snapshot.data;
          return data == null
              ? Center(child: Text('No hay datos.'))
              : ListView(children: _itemsList(data, context));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  List<Widget> _itemsList(List<dynamic> items, BuildContext context) {
    return items.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: getIcon(item['icon']),
            title: Text(item['texto']),
            trailing: Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.blue,
            ),
            onTap: () {
              // FORMA TRADICIONAL DE NAVEGAR.
              // final route = MaterialPageRoute(
              //   builder: (context) => AlertPage(),
              // );

              // Navigator.push(context, route);

              Navigator.pushNamed(context, item['ruta']);
            },
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
