import 'package:flutter/cupertino.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  String chat;
  ChatMessage(
      {@required this.messageContent,
      @required this.messageType,
      @required this.chat});
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent: "Sa", messageType: "alıcı", chat: "Yunus Codonex"),
  ChatMessage(
      messageContent: "Napıyon?", messageType: "alıcı", chat: "Yunus Codonex"),
  ChatMessage(
      messageContent: "As, Kod yazıyorum sen?",
      messageType: "gönderen",
      chat: "Yunus Codonex"),
  ChatMessage(
      messageContent: "Ben de :D", messageType: "alıcı", chat: "Yunus Codonex"),
  ChatMessage(
      messageContent: "Selamun Aleykum Gardaşım",
      messageType: "alıcı",
      chat: "Gökhan Abi"),
  ChatMessage(
      messageContent: "Aleyküm Selam Abi",
      messageType: "gönderen",
      chat: "Gökhan Abi"),
  ChatMessage(
      messageContent: "Zoom'a geliyor musun",
      messageType: "alıcı",
      chat: "Gökhan Abi"),
  ChatMessage(
      messageContent: "Edip nerdesin",
      messageType: "alıcı",
      chat: "Mehmet Hakan"),
  ChatMessage(
      messageContent: "Evdeyim", messageType: "gönderen", chat: "Mehmet Hakan"),
  ChatMessage(
      messageContent: "Whatsapp'ı çökerttim ya la",
      messageType: "alıcı",
      chat: "Mehmet Hakan"),
];
