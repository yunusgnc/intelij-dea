import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/pages/store_page_view.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff2f2f2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://lh3.googleusercontent.com/-iqF_c6tOz4k/YLlIViYBiZI/AAAAAAAAAUM/vy3Kopf286ME7_M9IsJnsoi174QUwtPvACEwYBhgLKtQDABHVOhzjPG1Zw3BzQIHrog1Dm5GJmXSqu1y_6UgyC0L6r9zyt-NxJQwLbKko53up427-6xjVw1ulnXHsK2UGc4aLdldvnS9cVYfJVNId7Otei6hg5Ft0PtPRJzdwiCIX58VALwV48NzdhHNTTtdoFT5ePjS8doKKV9Xqwp8PdAt_BsoI21CQriMfNi5bJ7Hc3dsDurNPHoQL4c7oGhxPn6jm9ZyBbImFkaZ4cTtCbzWVntBHuQZi-pa30JmY5rhpXHTDN1kK-ZwZLADl0fwSjQjQN1bAghmNczN7O7pZd3ht1f43QIkM7ws-bvD9uEVQVblYm1SU1-9fRRnBaDisJD4fW3QVPzIQmKz2N1k54A0fcXjms6S5nQN02rXMHpu6DQCafyetFJeMHizLCHSW0XuJZZd047LWQPnZPObyMoXPl3Q-Fs3WdqzttPu-96aZ-xizQiw07aVzzMiepuv0TL4jQMQWz9KPyFqjI35rgNXsKhho9fB_QEAoetf33gaOW5oCBxI801vH8RyaVQ9JpishvPdih3DcWpCkJDEdXWsbs35r7E40DpdUKVapu5wUIMWEubiBda61UMivLhG7it8trLlDCTQV4pjcRImTDGE-rtrYMJOGtokG/w140-h140-p/a77aa711c0f29e02c8364e29bca3facf.png"),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 1.0,
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                title: Text(
                  "Durumum",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Durum eklemek için dokun"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Görüntülenenler",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/1898555/pexels-photo-1898555.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                    ),
                    title: Text(
                      "Emel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Bugün, 20:16"),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoryPageView())),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
