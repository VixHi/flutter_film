import 'package:flutter/material.dart';

class DYFilmDetail extends StatefulWidget {
  final title, id;
  DYFilmDetail(this.title, this.id);

  @override
  _DYFilmDetailState createState() => _DYFilmDetailState();
}

class _DYFilmDetailState extends State<DYFilmDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
        elevation: 0.0,
      ),
      body: Center(
        child: Text("${widget.title}, ${widget.id}"),
      ),
    );
  }
}
