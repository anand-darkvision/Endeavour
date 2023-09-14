import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String name = "Maverick";
    var totalTaskPending = 0;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff454958),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.08,
              width: width * 0.3,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.07,
                        ),
                        Text(
                          "Hi $name",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'urita',
                            fontSize: height * 0.02 + width * 0.02,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.07,
                        ),
                        Text(
                          "$totalTaskPending task pending",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 252, 143, 128),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'urita',
                            fontSize: height * 0.02 + width * 0.01,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.4,
                ),
                CircleAvatar(
                  radius: height * 0.02 + width * 0.03,
                  backgroundColor: Colors.grey[800],
                  backgroundImage: const AssetImage("assets/Image/male.png"),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: width * 0.08,
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.84,
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: _searchText,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          print("pressed");
                        },
                        child: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                          size: height * 0.001 + width * 0.07,
                        ),
                      ),
                      fillColor: const Color(0xcf535867),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: height * 0.0017,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.white,
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black,
                          width: height * 0.01 + width * 0.02,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.08,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: width * 0.07,
                ),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: height * 0.02 + width * 0.02,
                    fontFamily: "ibmmedium",
                  ),
                ),
                SizedBox(
                  width: width * 0.34,
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/createtask');
                  },
                  child: Text(
                    "Create Task",
                    style: TextStyle(
                      fontSize: height * 0.01 + width * 0.016,
                      fontFamily: "ibmregular",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.05),
            Row(
              children: <Widget>[
                SizedBox(
                  width: width * 0.06,
                ),
                SizedBox(
                  height: height * 0.27,
                  width: width * 0.5,
                  child: const Card(
                    color: Color(0xcf535867),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.06),
            Row(
              children: <Widget>[
                SizedBox(
                  width: width * 0.08,
                ),
                Text(
                  "Ongoing Task",
                  style: TextStyle(
                    fontSize: height * 0.02 + width * 0.02,
                    fontFamily: "ibmmedium",
                  ),
                ),
                SizedBox(width: width * 0.4),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 252, 143, 128),
                      fontSize: height * 0.01 + width * 0.016,
                      fontFamily: "ibmregular",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: width * 0.06,
                ),
                SizedBox(
                  height: height * 0.27,
                  width: width * 0.89,
                  child: const Card(
                    color: Color(0xcf535867),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.06),
          ],
        ),
      ),
    );
  }
}
