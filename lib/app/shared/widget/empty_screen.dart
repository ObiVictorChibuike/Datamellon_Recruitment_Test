import 'package:flutter/material.dart';


class EmptyScreen extends StatelessWidget {
  final String? emptyScreenMessage;
  const EmptyScreen({Key? key, this.emptyScreenMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(emptyScreenMessage ?? "", style: TextStyle(color: Color(0xFF52575C), fontSize: 15),),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 70),
                child: SizedBox(height: 48, width: double.maxFinite,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}