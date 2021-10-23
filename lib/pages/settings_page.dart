import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        AppBar,
        BuildContext,
        CircleAvatar,
        Colors,
        FontWeight,
        Icon,
        Icons,
        ListTile,
        ListView,
        MaterialPageRoute,
        Navigator,
        NetworkImage,
        Scaffold,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:shared_preferences/shared_preferences.dart';

_read(key) async {
  final prefs = await SharedPreferences.getInstance();

  final value = prefs.getString(key) ?? 0;
  print('read: $value');
}

_save(key, value) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString(key, value);
  print('saved $value');
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
      ),
      body: new ListView(
        children: [
          ListTile(
              title: Text("Profil Ayarları"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/-iqF_c6tOz4k/YLlIViYBiZI/AAAAAAAAAUM/vy3Kopf286ME7_M9IsJnsoi174QUwtPvACEwYBhgLKtQDABHVOhzjPG1Zw3BzQIHrog1Dm5GJmXSqu1y_6UgyC0L6r9zyt-NxJQwLbKko53up427-6xjVw1ulnXHsK2UGc4aLdldvnS9cVYfJVNId7Otei6hg5Ft0PtPRJzdwiCIX58VALwV48NzdhHNTTtdoFT5ePjS8doKKV9Xqwp8PdAt_BsoI21CQriMfNi5bJ7Hc3dsDurNPHoQL4c7oGhxPn6jm9ZyBbImFkaZ4cTtCbzWVntBHuQZi-pa30JmY5rhpXHTDN1kK-ZwZLADl0fwSjQjQN1bAghmNczN7O7pZd3ht1f43QIkM7ws-bvD9uEVQVblYm1SU1-9fRRnBaDisJD4fW3QVPzIQmKz2N1k54A0fcXjms6S5nQN02rXMHpu6DQCafyetFJeMHizLCHSW0XuJZZd047LWQPnZPObyMoXPl3Q-Fs3WdqzttPu-96aZ-xizQiw07aVzzMiepuv0TL4jQMQWz9KPyFqjI35rgNXsKhho9fB_QEAoetf33gaOW5oCBxI801vH8RyaVQ9JpishvPdih3DcWpCkJDEdXWsbs35r7E40DpdUKVapu5wUIMWEubiBda61UMivLhG7it8trLlDCTQV4pjcRImTDGE-rtrYMJOGtokG/w140-h140-p/a77aa711c0f29e02c8364e29bca3facf.png"),
              )),
          ListTile(
            title: Text("Hesap Ayarları"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text("Sohbet Ayarları"),
            leading: Icon(Icons.message),
            onTap: () => chatSettings(context),
          ),
          ListTile(
            title: Text("Sohbet Ayarları"),
            leading: Icon(Icons.message),
          ),
          ListTile(
            title: Text("Bildirim Ayarları"),
            leading: Icon(Icons.notifications),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text("Developed by Artificial Intellectuals LLC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue))),
        ],
      ),
    );
  }
}

void chatSettings(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ChatSettingsPage()));
}

void setPreferencedColor(String color) async {
  _save("backgroundColor", color);
  _read("backgroundColor");
}

class ChatSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: Alignment.center,
              child: ListTile(
                tileColor: Colors.blue,
                title: Text("Arkaplan Rengi:",
                    style: TextStyle(color: Colors.white)),
                leading: Icon(
                  Icons.color_lens,
                  color: Colors.white,
                ),
              )),
          ListTile(
            title: Text("Red"),
            onTap: () => setPreferencedColor("red"),
            leading: Icon(
              Icons.circle,
              color: Colors.red,
            ),
          ),
          ListTile(
              title: Text("Blue"),
              onTap: () => setPreferencedColor("blue"),
              leading: Icon(
                Icons.circle,
                color: Colors.blue,
              )),
          ListTile(
              title: Text("Purple"),
              onTap: () => setPreferencedColor("purple"),
              leading: Icon(
                Icons.circle,
                color: Colors.purple,
              ))
        ],
      ),
    );
  }
}
