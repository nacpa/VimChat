import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {

  const BubbleText(
      {Key? key,
      required this.TextMessage,
      required this.TextUser,
      required this.TextTime,
      required this.itsMe})
      : super(key: key);

  final String TextMessage;
  final String TextUser;
  final Timestamp TextTime;
  final bool itsMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            itsMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[

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
          SizedBox(height: 2
            ,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [ Text(
            '$TextUser'.replaceAll(RegExp(r'@gmail.com'), ''),
            style:  TextStyle(color: Colors.grey, fontSize: 15),
          ),SizedBox(width: 5,),
              Text("${TextTime.toDate().hour}"+":"+"${TextTime.toDate().minute}",style:  TextStyle(color: Colors.grey, fontSize: 15),)],)

        ],
      ),
    );
  }
}
