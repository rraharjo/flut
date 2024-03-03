import 'package:flutter/material.dart';
import 'Performance.dart';

class TextInputWidget extends StatefulWidget {
  final void Function(Ticket) callback;
  const TextInputWidget({super.key, required this.callback});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();
  final TextEditingController myController3 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    myController1.clear();
    myController2.clear();
    myController3.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: TextField(
              controller: myController1,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.question_mark_rounded),
                labelText: 'Event',
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: TextField(
              controller: myController2,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                labelText: 'Performer name',
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: TextField(
              controller: myController3,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.monetization_on_sharp),
                labelText: 'price',
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              widget.callback(Ticket(myController1.text, myController2.text,
                  double.parse(myController3.text)));
              //dispose();
              myController1.clear();
              myController2.clear();
              myController3.clear();
            },
            icon: Icon(Icons.add))
      ],
    );
  }
}
