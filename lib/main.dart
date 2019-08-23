import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_workshop/image_data.dart';
import 'package:flutter_animation_workshop/star_fab.dart';
import 'package:flutter_animation_workshop/zoom.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ImageData>> _images;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _images ??= rootBundle
        .loadString('assets/image_metadata.json')
        .then(jsonDecode)
        .then((dynamic jsonEntries) {
      List<dynamic> jsonList = jsonEntries;
      return jsonList
          .map((dynamic jsonEntry) => ImageData.fromJson(jsonEntry))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<ImageData>>(
        future: _images,
        builder: (BuildContext _, AsyncSnapshot<List<ImageData>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(children: [
              const SizedBox(height: 24),
              ...snapshot.data.map((ImageData data) =>
                  ImageBox(key: ValueKey(data.filename), imageData: data)),
              const SizedBox(height: 24),
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  final ImageData imageData;

  const ImageBox({Key key, @required this.imageData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext _) => Zoom(imageData: imageData),
            ));
          },
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: OverflowBox(
              maxHeight: double.maxFinite,
              child: Image.asset('assets/images/${imageData.filename}'),
            ),
          ),
        ),
        Positioned(top: 0, bottom: 0, left: 24, child: StarFab()),
      ]),
    );
  }
}
