import 'package:flutter/cupertino.dart';

class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final Function pressed;

  ChatModel({this.name, this.message, this.time, this.avatarUrl, this.pressed});
}

void asd() {
  print("hello");
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Yunus Codonex",
      message: "Ben de :D",
      time: "15:30",
      avatarUrl:
          "https://media.discordapp.net/attachments/734569820812738601/882072758148804669/0c63e534-9937-4014-be38-6b44a559437a.png",
      pressed: asd),
  new ChatModel(
      name: "Mehmet Hakan",
      message: "Whatsapp'ı çökerttim ya la",
      time: "17:30",
      avatarUrl:
          "https://yt3.ggpht.com/ytc/AKedOLSBbdMgyxWru4DSTQYJSvdNvVe31sVWNJIPN0xl3A=s900-c-k-c0x00ffffff-no-rj"),
  new ChatModel(
      name: "Gökhan Abi",
      message: "Zoom'a geliyor musun",
      time: "5:00",
      avatarUrl:
          "https://media.discordapp.net/attachments/734569820812738601/882072752239038474/8bc4667a-3154-440d-8f5a-ddf377364e50.png"),
  new ChatModel(
      name: "Muhammed Y",
      message: "Seni bekliyoruz",
      time: "10:30",
      avatarUrl:
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
  new ChatModel(
      name: "Ahmet Demir",
      message: "...",
      time: "12:30",
      avatarUrl:
          "https://yt3.ggpht.com/ytc/AKedOLSBbdMgyxWru4DSTQYJSvdNvVe31sVWNJIPN0xl3A=s900-c-k-c0x00ffffff-no-rj"),
  new ChatModel(
      name: "Şamil ",
      message: "Ameliyat nasıl geçti",
      time: "15:30",
      avatarUrl:
          "https://yt3.ggpht.com/ytc/AKedOLSBbdMgyxWru4DSTQYJSvdNvVe31sVWNJIPN0xl3A=s900-c-k-c0x00ffffff-no-rj"),
];
