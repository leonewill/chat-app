import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

final ThemeData kitIOS = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light
);

final ThemeData kitDefault = ThemeData(
  primarySwatch: Colors.purple,
  primaryColor: Colors.purple
);

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat app",
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).platform == TargetPlatform.iOS ? kitIOS : kitDefault,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat App"),
          centerTitle: true,
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor
              ),
              child: TextComposer(),
            )
          ],
        ),
      ),
    );
  }
}

class TextComposer extends StatefulWidget {
  TextComposer({Key key}) : super(key: key);

  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).accentColor
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: Theme.of(context).platform == TargetPlatform.iOS ?
          BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[200]
              )
            )
          ) : null,
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(Icons.photo_camera),
                  onPressed: (){},
                ),
              ),

              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "Digite a sua mensagem..."
                  ),
                  onChanged: (text){
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                )
              ),

              Container(
                child: Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                    child: Text("Enviar"),
                    onPressed: _isComposing
                      ? (){}
                      : null
                  ) : IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _isComposing
                      ? (){}
                      : null
                  )
              )
            ],
          ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}
