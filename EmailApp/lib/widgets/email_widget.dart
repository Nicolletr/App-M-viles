import 'package:flutter/material.dart';
import '../models/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(email.id);
      },
      onLongPress: () {
        onLongPress(email.id);
      },
      onTap: () {
        onTap(email);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                    color: email.read
                        ? Colors.transparent
                        : const Color(0xff800000),
                    shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(email.dateTime.toString().substring(0, 10),
                      style: const TextStyle(
                        color: Color(0xffb0bec5),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      )),
                  Text(email.from,
                      style: const TextStyle(
                        color: Color(0xff212121),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      )),
                  Text(email.subject,
                      style: const TextStyle(
                        color: Color(0xffb0bec5),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
