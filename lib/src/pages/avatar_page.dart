import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatares'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya_400x400.jpg',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.indigo,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FadeInImage(
          image: NetworkImage(
            'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stan-lee-arrives-at-the-premiere-of-disney-and-marvels-news-photo-950501274-1542049801.jpg',
          ),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
