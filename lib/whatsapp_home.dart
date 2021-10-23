import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/pages/chat_screen.dart';
import './pages/settings_page.dart';

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
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
