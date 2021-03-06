import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DYFilmDrawer extends StatefulWidget {
  @override
  _DYFilmDrawerState createState() => _DYFilmDrawerState();
}

class _DYFilmDrawerState extends State<DYFilmDrawer> {


  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("一维空间"), 
          accountEmail: Text("hi_vix@163.com"),
          currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/59596574?v=4")),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://avatars.githubusercontent.com/u/59596574?v=4"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.blue[600].withOpacity(0.6), BlendMode.hardLight),
            )
          ),
        ),
      
        ListTile(
          title: Text("用户反馈"), 
          trailing: Icon(Icons.feedback),
          onTap: getImage,
        ),
        ListTile(
          title: Text("系统设置"), 
          trailing: Icon(Icons.settings),
          onTap: (){},
        ),
        ListTile(
          title: Text("我要发布"), 
          trailing: Icon(Icons.send),
          onTap: (){}
        ),
        Divider(height: 1, color: Colors.black),
        ListTile(
          title: Text("注销"), 
          trailing: Icon(Icons.exit_to_app),
          onTap: (){

          },
        ),
      ],
    );
  }
}