import 'package:flutter/material.dart';

class PopupMessage extends StatefulWidget {
  final String text;
  const PopupMessage({@required this.text});
  @override
  _PopupMessageState createState() => _PopupMessageState();
}

class _PopupMessageState extends State<PopupMessage> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> _fadeAnimation1;
  Animation<double> _fadeAnimation2;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );

    _fadeAnimation1 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0, 0.4,
          curve: Curves.easeOutCubic
        )
      )
    );

     _fadeAnimation2 = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6, 1.0,
          curve: Curves.easeOutCubic
        )
      )
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0),
      child: FadeTransition(
        opacity: _fadeAnimation1,
        child: FadeTransition(
          opacity: _fadeAnimation2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80.0,
            child: Center(child: Text(widget.text, style: TextStyle(fontSize: 50.0),)),
          ),
        ),
      ),
    );
  }
}