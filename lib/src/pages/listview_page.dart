import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final ScrollController _scrollController = ScrollController();

  List<int> _numbersList = [];
  int _lastNumberListItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _add10Items();

    _scrollController.addListener(() {
      double currentScroll = _scrollController.position.pixels;
      double maxScroll = _scrollController.position.maxScrollExtent;

      if (currentScroll == maxScroll) {
        // _add10Items();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Builder'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (context, index) {
          final int image = _numbersList[index];

          return FadeInImage(
            width: 500.0,
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/$image/500/300'),
          );
        },
      ),
    );
  }

  void _add10Items() {
    final int lastNumber =
        _numbersList.isNotEmpty ? _numbersList.last : _lastNumberListItem;

    setState(() {
      _numbersList.addAll(
        List.generate(10, (index) => lastNumber + index + 1),
      );
    });

    _lastNumberListItem = _numbersList.last;
  }

  Future<Timer> _fetchData() async {
    setState(() => _isLoading = true);

    final Duration duration = Duration(seconds: 2);
    return Timer(duration, httpResponse);
  }

  void httpResponse() {
    setState(() => _isLoading = false);

    _scrollController.animateTo(
      _scrollController.position.pixels + 150.0,
      duration: Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
    );

    _add10Items();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(bottom: 16.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Container();
    }
  }

  Future<dynamic> _getPage1() async {
    final Duration duration = Duration(seconds: 2);
    void callback() {
      _numbersList.clear();
      _add10Items();
    }

    return Future.delayed(duration, callback);
  }
}
