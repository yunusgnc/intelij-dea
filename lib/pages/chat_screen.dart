import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../models/list_messages.dart';
import 'package:camera/camera.dart';
import '../pages/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

var chatter = " ";
var avatarUrl = " ";
var getmessages = [];
final TextEditingController _textEditingController = TextEditingController();

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

void settingPage(context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SettingsPage()));
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  final _dumData = dummyData;
  var _getPeople = [];
  TabController _tabController;
  bool showFab = true;
  var bgColor;

  @override
  void initState() {
    _getPeople = _dumData;
    bgColor = Colors.white;
    var col = " ";

    _read("backgroundColor").then((value) => col = value);
    print("col is" + col);

    if (col == "a") {
      bgColor = Colors.red;
    } else {
      if (col == "red") {
        print("hello");
        bgColor = Colors.red;
      } else if (col == "blue") {
        bgColor = Colors.blue;
      } else if (col == "purple") {
        bgColor = Colors.purple;
      }
    }
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 0, length: 1);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  Future _read(key) async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString(key) ?? 0;
    return value;
  }

  // _save(key,value) async {
  //       final prefs = await SharedPreferences.getInstance();

  //       prefs.setString(key, value);
  //       print('saved $value');
  //     }

  void searchPeople(String searchValue, BuildContext context) {
    List results = [];
    if (searchValue.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _dumData;
    } else {
      results = _dumData
          .where((user) =>
              user.name.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _getPeople = results;
    });
  }

  void searchMessages(String searchValue) {}

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text("IntelliChat"),
          elevation: 0.7,
          bottom: PreferredSize(
              preferredSize: Size(15, 50),
              child: TextField(
                controller: _textEditingController,
                onChanged: (value) {
                  searchPeople(value, context);
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                ),
              )),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
            IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  settingPage(context);
                }),
          ],
        ),
        drawer: Drawer(
            child: ListView(children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://lh3.googleusercontent.com/-iqF_c6tOz4k/YLlIViYBiZI/AAAAAAAAAUM/vy3Kopf286ME7_M9IsJnsoi174QUwtPvACEwYBhgLKtQDABHVOhzjPG1Zw3BzQIHrog1Dm5GJmXSqu1y_6UgyC0L6r9zyt-NxJQwLbKko53up427-6xjVw1ulnXHsK2UGc4aLdldvnS9cVYfJVNId7Otei6hg5Ft0PtPRJzdwiCIX58VALwV48NzdhHNTTtdoFT5ePjS8doKKV9Xqwp8PdAt_BsoI21CQriMfNi5bJ7Hc3dsDurNPHoQL4c7oGhxPn6jm9ZyBbImFkaZ4cTtCbzWVntBHuQZi-pa30JmY5rhpXHTDN1kK-ZwZLADl0fwSjQjQN1bAghmNczN7O7pZd3ht1f43QIkM7ws-bvD9uEVQVblYm1SU1-9fRRnBaDisJD4fW3QVPzIQmKz2N1k54A0fcXjms6S5nQN02rXMHpu6DQCafyetFJeMHizLCHSW0XuJZZd047LWQPnZPObyMoXPl3Q-Fs3WdqzttPu-96aZ-xizQiw07aVzzMiepuv0TL4jQMQWz9KPyFqjI35rgNXsKhho9fB_QEAoetf33gaOW5oCBxI801vH8RyaVQ9JpishvPdih3DcWpCkJDEdXWsbs35r7E40DpdUKVapu5wUIMWEubiBda61UMivLhG7it8trLlDCTQV4pjcRImTDGE-rtrYMJOGtokG/w140-h140-p/a77aa711c0f29e02c8364e29bca3facf.png"),
                    fit: BoxFit.cover)),
            child: Text("Krios",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0))),
          ),
          ListTile(
              title: Text("Ayarlar"),
              leading: new Icon(Icons.settings),
              onTap: () => settingPage(context)),
          ListTile(
              title: Text("FAQ"),
              leading: new Icon(Icons.accessibility),
              onTap: () => print("FAQ page"))
        ])),
        floatingActionButton: showFab
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                onPressed: () => print("open chats"),
              )
            : null,
        body: new ListView.builder(
          itemCount: _getPeople.length,
          itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                  tileColor: bgColor,
                  leading: new CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.blue,
                    backgroundImage: new NetworkImage(_getPeople[i].avatarUrl),
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        _getPeople[i].name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        _getPeople[i].time,
                        style:
                            new TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      _getPeople[i].message,
                      style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                  onTap: () => openChat(
                      _getPeople[i].name, _getPeople[i].avatarUrl, context)),
            ],
          ),
        ));
  }
}

void openChat(name, avatar, BuildContext context) {
  getmessages = [];
  chatter = name;
  avatarUrl = avatar;
  messages.forEach((element) {
    if (element.chat == chatter) {
      getmessages.add({element.messageContent: element.messageType});
    }
  });

  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => NewScreen()));
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Chat with ${chatter}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Çevrimiçi",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Bir mesaj yaz...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            itemCount: getmessages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (getmessages[index].values.first == "alıcı"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (getmessages[index].values.first == "alıcı"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      getmessages[index].keys.first,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
