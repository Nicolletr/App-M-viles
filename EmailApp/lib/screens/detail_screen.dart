import 'package:flutter/material.dart';
import '../models/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(email.subject),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: ${email.from}',
                  style: const TextStyle(
                    color: Color(0xff212121),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 10.0),
              const SizedBox(height: 10.0),
              Text(email.subject,
                  style: const TextStyle(
                    color: Color(0xffb0bec5),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 5.0),
              Text(email.dateTime.toString().substring(0, 16),
                  style: const TextStyle(
                    color: Color(0xffb0bec5),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 10.0),
              const Divider(color: Color(0xff800000)),
              const SizedBox(height: 10.0),
              Text(email.body,
                  style: const TextStyle(
                    fontSize: 15.0,
                  )),
            ],
          ),
        ));
  }
}
