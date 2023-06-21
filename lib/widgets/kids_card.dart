import 'package:familyapp/models/kids_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KidsCard extends StatelessWidget {
  final KidsModel model;

  const KidsCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            foregroundImage: model.image?.isNotEmpty == true ? Image.network(
                model.image ?? "").image : AssetImage("assets/avatar_test.jpg"),
            radius: 45,
          ),
          SizedBox(width: 40,),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    fontFamily: 'OpenSansBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  model.age.toString(),
                  style: TextStyle(
                    fontFamily: 'OpenSansBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                if(model.school != null)
                Text(
                  model.school??'',
                  style: TextStyle(
                    fontFamily: 'OpenSansBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

              ],
            ),

          ),

        ],
      ),
    );
  }

}