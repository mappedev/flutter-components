import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _inputFieldDateController = TextEditingController();

  String _name = '';
  String _email = '';
  // String _password = '';
  String _date = '';
  String? _dropdownOptionSelected;

  List<String> _powers = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _showPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        counter: Text('Caracteres: ${_name.length}'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Solo el nombre por favor.',
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility),
      ),
      onChanged: (value) => setState(() => _name = value),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        hintText: 'Correo',
        labelText: 'Correo',
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock),
      ),
      // onChanged: (value) => _password = value,
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        hintText: 'Fecha',
        labelText: 'Fecha',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.date_range),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2024),
      locale: Locale('es', 'VE'),
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    final Iterable<DropdownMenuItem<String>> iterable = _powers.map((power) {
      return DropdownMenuItem(
        child: Text(power),
        value: power,
      );
    });
    return iterable.toList();
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 8.0),
        DropdownButton(
          value: _dropdownOptionSelected,
          hint: Text('Poder'),
          items: getDropdownOptions(),
          onChanged: (value) {
            setState(() {
              _dropdownOptionSelected = value.toString();
            });
          },
        ),
      ],
    );
  }

  Widget _showPerson() {
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Correo: $_email'),
      trailing: Text(_dropdownOptionSelected ?? 'No especificado'),
    );
  }
}
