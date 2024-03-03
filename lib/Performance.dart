import 'package:flutter/material.dart';

class Ticket {
  String _title;
  String _performer;
  double _price;
  bool _bought = false;
  String desription = '';

  Ticket(this._title, this._performer, this._price);

  void buyTicket() {
    this._bought = !this._bought;
  }
}

class TicketWidget extends StatefulWidget {
  final Ticket theTicket;

  const TicketWidget({super.key, required this.theTicket});

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  String _toolTip = 'Buy a Ticket';
  Icon _moneyIcon = const Icon(
    Icons.attach_money,
    color: Colors.black,
  );

  void buyTicket() {
    widget.theTicket.buyTicket();
    if (widget.theTicket._bought) {
      setState(() {
        _moneyIcon = const Icon(
          Icons.attach_money,
          color: Colors.green,
        );
        _toolTip = 'Bought';
      });
    } else {
      setState(() {
        _moneyIcon = const Icon(
          Icons.attach_money,
          color: Colors.black,
        );
        _toolTip = 'Buy a Ticket';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.music_note, color: Colors.pink),
      title: Text(this.widget.theTicket._title),
      subtitle: Text('Performer: ${this.widget.theTicket._performer}\nPrice :${this.widget.theTicket._price}'),
      isThreeLine: true,
      trailing: IconButton(
        onPressed: buyTicket,
        splashColor: const Color.fromARGB(255, 101, 35, 216),
        splashRadius: 10,
        hoverColor: Colors.greenAccent,
        icon: _moneyIcon,
        tooltip: this._toolTip,
      ),
    );
  }
}
