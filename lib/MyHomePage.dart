import 'package:jordi_gpt/themenotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'message.dart';

class MyHomePage extends ConsumerStatefulWidget {
  // const MyHomePage({super.key, required this.title});

  // final String title;
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  final List<Message> _messages = [
    // Message(text: "Hii", isUser: true),
    // Message(text: "Hello What's up ?", isUser: false),
    // Message(text: "Great and you", isUser: true),
    // Message(text: "Im Excellent", isUser: false),
  ];
  bool _isLoading = false;

  callGeminiModel() async {
    try {
      if (_controller.text.isNotEmpty) {
        _messages.add(Message(text: _controller.text, isUser: true));
        _isLoading = true;
          setState(() {}); // Trigger a UI update to show loading indicator
      }
       // Simulate thinking time (for example, 2 seconds delay)
    await Future.delayed(Duration(seconds: 1));


      final model = GenerativeModel(
          model: 'gemini-pro', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final prompt = _controller.text.trim();
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      setState(() {
        _messages.add(Message(text: response.text!, isUser: false));
         _isLoading = false;
      });
      _controller.clear();
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.read(themeProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        shadowColor: Colors.grey, // Adjust this for desired shadow color
        // elevation: 1.0, // Adjust this value to control shadow intensity
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Image.asset('assets/gpt-robot.png'),

                  // robot image??

                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Jordi Gpt',
                    style: (currentTheme == ThemeMode.dark)
                        ? Theme.of(context).textTheme.titleLarge
                        : Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
            GestureDetector(
                child: (currentTheme == ThemeMode.dark)
                    ? Icon(
                        Icons.light_mode,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : Icon(
                        Icons.dark_mode,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                onTap: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                })
            //volume image
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final messsage = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: messsage.isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: messsage.isUser
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              borderRadius: messsage.isUser
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))
                                  : BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                          child: Text(
                            messsage.text,
                            style: messsage.isUser
                                ? Theme.of(context).textTheme.bodyMedium
                                : Theme.of(context).textTheme.bodySmall,
                          )),
                    ),
                  );
                }),
          ),
          //Userinput
          Padding(
            padding: const EdgeInsets.only(bottom: 32, top: 16.0, right: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        offset: Offset(0, 3))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                          hintText: 'Write Your Message',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  //           IconButton(
                  // onPressed: (){},
                  //  icon: Icon(Icons.send))
                  _isLoading ?
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                    ) :
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: Image.asset('assets/paper-plane_9131554.png'),
                      onTap: callGeminiModel,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// fix : failed to initialize flutter process exited with error 9009