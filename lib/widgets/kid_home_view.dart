import 'package:familyapp/models/kids_model.dart';
import 'package:flutter/material.dart';

class KidHomeView extends StatelessWidget {
  final KidsModel kid;
  const KidHomeView({Key? key, required this.kid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          foregroundImage: kid.image?.isNotEmpty == true ? Image.network(
              kid.image ?? "").image : AssetImage("assets/avatar_test.jpg"),
          radius: 45,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '${kid.name}',
            style: TextStyle(
              fontFamily: 'OpenSansBold',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
