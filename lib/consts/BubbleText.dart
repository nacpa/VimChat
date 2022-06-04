import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {
  const BubbleText(
      {Key? key,
        required this.TextMessage,
        required this.TextUser,
        required this.itsMe})
      : super(key: key);

  final String TextMessage;
  final String TextUser;
  final bool itsMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
        itsMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
             '$TextUser'.replaceAll(RegExp(r'@gmail.com'), ''),
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Material(
            elevation: 10,
            borderRadius: itsMe
                ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )
                : const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            color: itsMe ? Colors.orange : Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  TextMessage,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
