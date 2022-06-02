import 'package:flutter/material.dart';


class Credits extends StatefulWidget {
  const Credits({Key key}) : super(key: key);

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const  Center(child:
          Text("Developed by <carticss>", style: TextStyle(color: Colors.white))
      ),
    );
  }
}
