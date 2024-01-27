import 'package:flutter/material.dart';

class HomeTopRow extends StatelessWidget {
  const HomeTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(20),
      width: size.width - 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello Champ",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  )
              ),
              Text("Test, Learn, Conquer",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25
                  )
              )
            ],
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/cat_cute.jpeg"),
            radius: 25,
          )
        ],
      )
    );
  }
}
