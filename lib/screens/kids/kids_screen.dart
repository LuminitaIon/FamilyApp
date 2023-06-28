import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/screens/kids/kids_cubit.dart';
import 'package:familyapp/widgets/kids_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KidsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KidsCubit()..init(context.read<FamilyBloc>().state.family),
      child: BlocBuilder<KidsCubit, KidsState>(
        builder: (context, state) {
          return ListView(
            children: state.result.map((e) => KidsCard(model: e)).toList(),
          );
        },
      ),
    );
  }

}