import 'package:familyapp/screens/kids/kids_cubit.dart';
import 'package:familyapp/widgets/kids_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KidsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KidsCubit, KidsState>(
      builder: (context, state) {
        return ListView(
          children: state.result.map((e) => KidsCard(model: e)).toList(),
        );
      },
    );
  }

}