import 'package:chat/widget_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 238, 234),
        appBar: AppBar(
          title: const SelectionContainer.disabled(child: Text('Chatroom')),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: WidgetStyle.screenPadding,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ChatViewItem(
                      isRight: true,
                      avatar: Icons.person,
                      text: 'Hello.',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'Hi.',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'Welcome to company, how can I help you?',
                    ),
                    _ChatViewItem(
                      isRight: true,
                      avatar: Icons.person,
                      text: 'I want to know how many products the company has, and which product is suitable for me？',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'We have...',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'and...',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'You can try...',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'Or...',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'Do you have any other questions?',
                    ),
                    _ChatViewItem(
                      isRight: true,
                      avatar: Icons.person,
                      text: 'No, thanks.',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'Have a good day.',
                    ),
                    _ChatViewItem(
                      avatar: Icons.people,
                      text: 'If you have any questions, please feel free to contact us.',
                    ),
                  ],
                ),
              ),
            ),
            const SelectionContainer.disabled(child: InputTextField()),
          ],
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'How can I help you?',
            suffixIcon: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatViewItem extends StatelessWidget {
  const _ChatViewItem({
    Key? key,
    this.isRight = false,
    required this.avatar,
    required this.text,
  }) : super(key: key);

  final bool isRight;
  final IconData avatar;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isRight)
            CircleAvatar(
              child: Icon(avatar),
            ),
          _ChatViewBody(
            isRight: isRight,
            text: text,
          ),
          if (isRight)
            CircleAvatar(
              child: Icon(avatar),
            ),
        ],
      ),
    );
  }
}

class _ChatViewBody extends HookWidget {
  const _ChatViewBody({
    Key? key,
    required this.isRight,
    required this.text,
  }) : super(key: key);

  final bool isRight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isRight)
          Container(
            margin: const EdgeInsets.only(top: 12),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 8,
                  color: Colors.transparent,
                ),
                top: BorderSide(
                  width: 8,
                  color: Colors.transparent,
                ),
                left: BorderSide(
                  width: 12,
                  color: Colors.transparent,
                ),
                right: BorderSide(
                  width: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.63),
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        if (isRight)
          Container(
            margin: const EdgeInsets.only(top: 12),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 8,
                  color: Colors.transparent,
                ),
                top: BorderSide(
                  width: 8,
                  color: Colors.transparent,
                ),
                left: BorderSide(
                  width: 12,
                  color: Colors.white,
                ),
                right: BorderSide(
                  width: 12,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
