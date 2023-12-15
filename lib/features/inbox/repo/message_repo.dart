import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/inbox/model/message_model.dart';

class MessageRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    await _db
        .collection("chat_rooms")
        .doc("PelepxiUACQmp4QBdvNo")
        .collection("texts")
        .add(message.toJson());
  }
}

final messageRepo = Provider(
  (ref) => MessageRepo(),
);
