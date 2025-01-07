import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis nunc semper, ultrices risus sed, luctus orci. Aenean accumsan iaculis nunc ac mattis. Nullam scelerisque, orci non suscipit faucibus, tellus dui rutrum elit, vel finibus nunc enim at urna. Fusce blandit auctor maximus. Etiam tincidunt aliquet blandit. Sed gravida nulla quis purus tempor tempus. Fusce eget hendrerit ante, ut elementum tortor. Nunc eu purus iaculis, euismod tortor non, bibendum tortor.

Aliquam in nibh luctus ligula ultrices lacinia. Sed feugiat est nisl, sed dignissim dolor condimentum quis. Aliquam erat volutpat. Ut id urna lorem. Etiam neque libero, venenatis eget dolor non, gravida ultricies enim. Aliquam sit amet vestibulum sem, a pretium eros. Fusce scelerisque orci quis condimentum molestie. Mauris felis metus, auctor tincidunt cursus et, sollicitudin lacinia est. Curabitur gravida aliquet nulla vel egestas. Donec pretium tristique leo, sed tincidunt lacus ultrices ut. Proin aliquam dapibus rhoncus. Nam sagittis mi ut libero vulputate, id sollicitudin nisl laoreet. Mauris laoreet commodo sagittis. Vivamus sit amet metus eu tellus aliquam vehicula.

Nullam nec velit eu enim tristique accumsan et vitae justo. In hac habitasse platea dictumst. Suspendisse dapibus elit justo, at blandit ex vestibulum et. Aliquam pellentesque nulla ut sapien porta, nec pretium nulla ullamcorper. In et nibh id nibh auctor feugiat tincidunt tempus nibh. Donec ex dui, sagittis sed interdum eget, sollicitudin quis velit. Donec et blandit eros, eget lobortis nulla. Vestibulum malesuada leo arcu, eu euismod quam venenatis vel. Vivamus mollis mauris vitae lacinia eleifend. Mauris fermentum sem neque, eget luctus velit facilisis ac. Morbi mollis efficitur lorem, id cursus lorem tincidunt eu. Morbi eu metus eget quam porttitor tempus.

Vestibulum in posuere quam. Nulla auctor quam sapien, vel iaculis velit tempus quis. Sed nec interdum nulla. Nam et augue sapien. Sed facilisis leo vel felis vulputate euismod. Aliquam erat volutpat. Maecenas aliquam, mi id aliquet porta, mi tellus dictum leo, nec dictum felis sapien in dui. Integer congue id nisl a eleifend. Aenean sed augue risus. Integer ut sapien id ligula porta dignissim vel vitae massa. Etiam efficitur blandit pharetra. Proin nulla nibh, tincidunt id finibus a, iaculis a nibh. Vivamus gravida nisi eget mattis euismod. Ut lacinia mi ante, sit amet porttitor turpis sagittis id.

Mauris aliquet risus a libero viverra lacinia. Phasellus non nulla massa. Duis interdum accumsan urna, vitae dignissim augue viverra eget. Donec eget ligula et orci rutrum molestie at eu velit. Phasellus volutpat rhoncus velit, ut aliquet elit volutpat at. Suspendisse non orci turpis. Aliquam et risus et leo tincidunt varius ac a purus. Suspendisse rutrum sit amet odio sed dictum. Vivamus consectetur, felis a commodo iaculis, velit tortor fringilla enim, rutrum hendrerit mauris metus non tortor. Etiam cursus libero in tempor malesuada. Cras egestas ligula neque, ut aliquam ante lobortis a. Nam eu sollicitudin ante. Curabitur eget massa laoreet massa fermentum aliquam.
""";

/// Show the initial splash screen, welcome message and other
/// startup stuff for first time players
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    Future.delayed(Duration(seconds: 2), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 120), curve: Curves.linear);
    });
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: "Long press to skip",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        fontSize: 12.0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showToast,
      child: Scaffold(
        body: SafeArea(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width - 32,
                      height: 200,
                      child: const Placeholder()),
                  Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width - 32,
                      height: MediaQuery.sizeOf(context).height - 350,
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          child: const Text(text))),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.sizeOf(context).width - 32, 40),
                    ),
                    child: const Text("Continue"),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
