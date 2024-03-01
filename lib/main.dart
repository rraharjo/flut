import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is title'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextInputWidget(),
        ],
      ),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController myController = TextEditingController();
  String text = 'as';
  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  void changeStateText(String msg) {
    setState(() => this.text = msg);//setState will change the state of the widget
    if (this.text == 'Hello World'){
      setState(() => this.text = '');
    }
  }

  void Function(String) changeStateText2(){
    return (msg) => changeStateText(msg);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: myController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: 'Put something here',
          ),
          onChanged: changeStateText,//this will call the function with the text from the textbox as the function argument
        ),
        Text(this.text),
      ],
    );
  }
}
