// ESTA PÁGINA FUE HECHA PARA PROBAR.

// import 'package:flutter/material.dart';

// class HomePageTemp extends StatelessWidget {
//   final List<String> listTitles = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Componentes Temp'),
//         centerTitle: true,
//       ),
//       body: ListView(children: _createItemsShort()),
//     );
//   }

//   // ITERAR DE MANERA IMPERATIVA
//   // List<Widget> _createItems() {
//   //   List<Widget> list = [];

//   //   listTitles.forEach((String value) {
//   //     final tempWidget = ListTile(
//   //       title: Text(value),
//   //     );

//   //     list..add(tempWidget)..add(Divider());
//   //   });

//   //   return list;
//   // }

//   // ITERAR DE MANERA DECLARATIVA
//   List<Widget> _createItemsShort() {
//     return listTitles
//         .map((title) => Column(
//               children: <Widget>[
//                 ListTile(
//                   title: Text(title),
//                   subtitle: Text('Subtitulo'),
//                   leading: Icon(Icons.accessibility_sharp),
//                   trailing: Icon(Icons.arrow_right_alt),
//                   onTap: () {},
//                 ),
//                 Divider()
//               ],
//             ))
//         .toList();
//   }
// }
