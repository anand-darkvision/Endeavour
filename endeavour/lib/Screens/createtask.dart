import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff454958),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.07,
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/homescreen');
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: height * 0.002 + width * 0.06,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(
                width: width * 0.22,
              ),
              Text(
                "Todays Task",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'urita',
                  fontSize: height * 0.025 + width * 0.01,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.08,
              ),
              Text(
                "Create",
                style: TextStyle(
                  fontSize: height * 0.03 + width * 0.02,
                  fontFamily: "urita",
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.003,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.08,
              ),
              Text(
                "New Task",
                style: TextStyle(
                  fontSize: height * 0.03 + width * 0.02,
                  fontFamily: "urita",
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.08,
              ),
              Text(
                "Task Title",
                style: TextStyle(
                  fontSize: height * 0.014 + width * 0.01,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
