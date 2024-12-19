import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

List alldata = [];

Future getalldata() async {
  try {
    var reponse =
        await http.get(Uri.parse("https://api.jikan.moe/v4/anime/1/pictures"));
    List data = jsonDecode(reponse.body)['data'];
    data.forEach(
      (element) {
        alldata.add(element);
      },
    );
  } catch (e) {
    print("Gagal mengambil data!!");
    print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 33,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: getalldata(),
          builder: (context, snapshot) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Popular Anime",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Container(
                    height: 290,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: alldata.length >= 3 ? 3 : alldata.length,
                      itemBuilder: (context, index) {
                        final String imageUrl =
                            alldata[index]['jpg']['image_url'] ?? '';
                        return Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 125,
                                height: 185,
                                margin: EdgeInsets.fromLTRB(1, 20, 0, 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(5),
                                  image: imageUrl.isNotEmpty
                                      ? DecorationImage(
                                          image: NetworkImage(imageUrl),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Ucup Cilacap",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Container(
                        child: Text(
                          "Recomended",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: alldata.length >= 3 ? 3 : alldata.length,
                      itemBuilder: (context, index) {
                        final int dataIndex = index + 3;
                        final String imageUrl =
                            alldata[dataIndex]['jpg']['image_url'] ?? '';
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 110,
                              height: 170,
                              margin: EdgeInsets.fromLTRB(1, 20, 0, 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(5),
                                image: imageUrl.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width: 200,
                                  height: 60,
                                  child: Text(
                                    "Ore dake Level Up na Ken Season 2: Arise from the Shadow",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 210,
                                  height: 40,
                                  child: Text(
                                      "Action, Advanture, Romance, Psycological"),
                                ),
                                Container(
                                  width: 60,
                                  height: 30,
                                  child: Text("Rate : "),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text("Detail"),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
