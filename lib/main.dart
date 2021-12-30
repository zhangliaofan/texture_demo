import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Texture Demo';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MethodChannel _channel = const MethodChannel("opengl_texture");
  bool hasLoadTexture = false;
  int mainTexture = -1;

  @override
  void initState() {
    super.initState();
    newTexture();
  }

  void newTexture() async {
    mainTexture = await _channel.invokeMethod('newTexture');
    setState(() {
      hasLoadTexture = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      home: Scaffold(
        appBar: AppBar(title: const Text(MyApp._title)),
        body: Center(
          child: hasLoadTexture
              ? SizedBox(
                  width: 300,
                  height: 200,
                  child: Texture(textureId: mainTexture),
                )
              : const Text('loading...'),
        ),
      ),
    );
  }
}
