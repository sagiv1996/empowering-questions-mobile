import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:empowering_questions_mobile/controller/user_controller.dart';
import 'package:empowering_questions_mobile/register_page/mangment_categories.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _state = 'wait';

  @override
  void initState() {
    super.initState();
    _addNewMessage(
        isSender: false,
        text: "Hi ${UserController.user?.displayName} and welcome!",
        durationInMiliSecond: 1000);
    _addNewMessage(
        isSender: false,
        text:
            "We have created a smart chat that will allow you to easily and quickly register for the application",
        durationInMiliSecond: 1500);
    _addNewMessage(
        isSender: false,
        text: "The first step be choose your gender",
        durationInMiliSecond: 1800);
    _changeState(state: 'select gender', durationInMiliSecond: 2000);
  }

  void _changeState({String state = '', int durationInMiliSecond = 0}) {
    Future.delayed(Duration(milliseconds: durationInMiliSecond), () {
      setState(() {
        _state = state;
      });
    });
  }

  void _addNewMessage(
      {required bool isSender,
      required String text,
      int durationInMiliSecond = 0}) {
    Future.delayed(
        Duration(milliseconds: durationInMiliSecond),
        () => setState(() {
              _messages
                  .add(_newBubbleSpecialOne(isSender: isSender, text: text));
            }));
  }

  static Widget _newBubbleSpecialOne(
          {required bool isSender, required String text}) =>
      BubbleSpecialOne(
        text: text,
        isSender: isSender,
        color: isSender ? Color(0xFF1B97F3) : Color(0xFFE8E8EE),
        textStyle: TextStyle(
            color: isSender ? Colors.white : Colors.black, fontSize: 16),
      );

  final List<Widget> _messages = List<Widget>.empty(growable: true);

  Widget _responseOptions() {
    Widget response = Container();
    switch (_state) {
      case 'select gender':
        response = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GroupButton(
              buttons: ['male', 'famle'],
              options: GroupButtonOptions(),
              onSelected: (value, index, isSelected) {
                _changeState(state: '');
                _addNewMessage(
                    isSender: true, text: value);
                _addNewMessage(
                    isSender: false,
                    text: 'Great, I wrote it down',
                    durationInMiliSecond: 500);
                _addNewMessage(
                    isSender: false,
                    text:
                        'The next step will be to choose areas that you would like to improve in your life',
                    durationInMiliSecond: 800);
                _changeState(
                    state: 'select categories', durationInMiliSecond: 850);
              },
            ),
          ],
        );
        break;
      case "select categories":
        response = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MangmentCategories(onUpdateCategories: (List<String> categories) {
              _changeState(state: '');
              categories.forEach(
                  (element) => _addNewMessage(isSender: true, text: element));
              _addNewMessage(
                  isSender: false,
                  text: 'you are great',
                  durationInMiliSecond: 500);
              _addNewMessage(
                  isSender: false,
                  text:
                      'If you want to add more fields beyond the ${categories.length} fields you selected, you can always come back here and add more',
                  durationInMiliSecond: 800);
              _addNewMessage(
                  isSender: false,
                  text: 'Just before we go to the main screen',
                  durationInMiliSecond: 1100);
              _addNewMessage(
                  isSender: false,
                  text:
                      'How often would you like to receive empowering questions?',
                  durationInMiliSecond: 1400);
              _changeState(
                  state: 'select frequency', durationInMiliSecond: 1500);
            })
          ],
        );
        break;

      case "select frequency":
        response = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GroupButton(
              buttons: ['little', 'normal', 'extra'],
              onSelected: (value, index, isSelected) {
                _changeState(state: '');
                _addNewMessage(
                    isSender: true, text: value);
                _addNewMessage(
                    isSender: false,
                    text: "$value it's great",
                    durationInMiliSecond: 500);
                _addNewMessage(
                    isSender: false,
                    text: 'We immediately register you in the system',
                    durationInMiliSecond: 800);
                // TODO: register user for system
                _addNewMessage(
                    isSender: false,
                    text:
                        'registration succeeded. May you have an empowering and fun use!',
                    durationInMiliSecond: 1100);
              },
            ),
          ],
        );
        break;
    }
    return Align(
        alignment: Alignment.bottomCenter, child: Container(child: response));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("This is my title ")),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(children:[ ..._messages, _responseOptions()]),
        ),
        
      ]),
    );
  }
}
