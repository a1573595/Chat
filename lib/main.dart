import 'package:chat/widget_style.dart';
import 'package:equatable/equatable.dart';
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

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.isRight,
    required this.avatar,
    required this.text,
  });

  final bool isRight;
  final IconData avatar;
  final String text;

  @override
  List<Object?> get props => [
        isRight,
        avatar,
        text,
      ];
}

class MessageNotifier extends AutoDisposeNotifier<List<ChatMessage>> {
  @override
  List<ChatMessage> build() {
    return const [
      ChatMessage(
        isRight: true,
        avatar: Icons.person,
        text: 'Hello.',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'Hi.',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'Welcome to company, how can I help you?',
      ),
      ChatMessage(
        isRight: true,
        avatar: Icons.person,
        text: 'I want to know how many products the company has, and which product is suitable for me？',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'We have...',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'And...',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'You can...',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'Or...',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'Do you have any other questions?',
      ),
      ChatMessage(
        isRight: true,
        avatar: Icons.person,
        text: 'No, thanks.',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'Have a good day.',
      ),
      ChatMessage(
        isRight: false,
        avatar: Icons.people,
        text: 'If you have any questions, please feel free to contact us.',
      ),
    ];
  }

  void addMessage(String text) {
    state = [...state, ChatMessage(isRight: true, avatar: Icons.person, text: text)];
  }
}

final _messageProvider = NotifierProvider.autoDispose<MessageNotifier, List<ChatMessage>>(() => MessageNotifier());

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();

    final isMounted = useIsMounted();

    final lastKey = useMemoized(GlobalKey.new, const []);

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
              child: Consumer(
                builder: (context, ref, child) {
                  final messages = ref.watch(_messageProvider);

                  if (messages.isNotEmpty && messages.last.isRight) {
                    Future(() async {
                      if (isMounted()) {
                        await controller.animateTo(controller.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                        Scrollable.ensureVisible(lastKey.currentContext!);
                      }
                    });
                  }

                  return ListView.builder(
                    controller: controller,
                    padding: WidgetStyle.screenPadding,
                    physics: const BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (context, index) => _ChatViewItem(
                      key: index == messages.length - 1 ? lastKey : null,
                      isRight: messages[index].isRight,
                      avatar: messages[index].avatar,
                      text: messages[index].text,
                    ),
                  );
                },
              ),
            ),
            const SelectionContainer.disabled(child: InputTextField()),
          ],
        ),
      ),
    );
  }
}

class InputTextField extends HookConsumerWidget {
  const InputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    final isEmpty = useState(true);

    controller.addListener(() {
      isEmpty.value = controller.text.isEmpty;
    });

    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: TextFormField(
          controller: controller,
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
                  onPressed: !isEmpty.value
                      ? () {
                          if (controller.text.isNotEmpty) {
                            ref.read(_messageProvider.notifier).addMessage(controller.text);
                            controller.clear();
                          }
                        }
                      : null,
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

class _ChatViewBody extends StatelessWidget {
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
