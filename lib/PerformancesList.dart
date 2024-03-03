import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'InputTextField.dart';
import 'Performance.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<Ticket> myTickets = [
  ];

  void addTicket(Ticket ticket) {
    setState(() {
      myTickets.add(ticket);
    });
    //print(myTickets);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              itemCount: myTickets.length,
              itemBuilder: (buildContext, index) {
                return TicketWidget(theTicket: myTickets[index]);
              },
            ),
          ),
        ),
        TextInputWidget(
          callback: addTicket,
        ),
      ],
    );
  }
}
