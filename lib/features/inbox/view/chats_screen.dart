import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/view/chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  static const String routeName = "chats";
  static const String routeURL = "/chats";
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  final Duration _duration = const Duration(milliseconds: 300);

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: _duration,
      );
      _items.add(_items.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: _makeTile(index),
        ),
        duration: _duration,
      );

      _items.removeAt(index);
    }
  }

  void _onChatTap(int index) {
    context.pushNamed(
      ChatDetailScreen.routeName,
      params: {"chatId": "$index"},
    );
  }

  Widget _makeTile(int index) {
    return ListTile(
      onTap: () => _onChatTap(index),
      onLongPress: () => _deleteItem(index),
      key: UniqueKey(),
      leading: const CircleAvatar(
        radius: 30,
        child: Text("니꼬"),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Lynn ($index)",
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            "2:16 PM",
            style: TextStyle(
              fontSize: Sizes.size12,
              color: Colors.grey.shade500,
            ),
          )
        ],
      ),
      subtitle: const Text("Don't forget to make video"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direct messages"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
        elevation: 1,
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: _makeTile(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
