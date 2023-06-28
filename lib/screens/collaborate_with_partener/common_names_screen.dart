import 'package:familyapp/colors.dart';
import 'package:familyapp/screens/add_child/add_child_cubit.dart';
import 'package:familyapp/screens/collaborate_with_partener/common_names_cubit.dart';
import 'package:familyapp/screens/collaborate_with_partener/entering_name_cubit.dart';
import 'package:familyapp/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonNamesScreen extends StatelessWidget {
  final List<String> names;
  final AddChildCubit addCubit;

  const CommonNamesScreen({Key? key, required this.names,required this.addCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommonNamesCubit()..init(names),
      child: BlocBuilder<CommonNamesCubit, CommonNamesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                iconSize: 40,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: primaryColor,
                ),
              ),


              backgroundColor: secondaryColor,
            ),
            body: state.state == CommonNamesScreenState.loading
                ? const Center(child: LoadingWidget())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: <Widget>[
                            Text(
                              "Hi :) \nThis is the commons names you have!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: "OpenSansSemiBold",
                                  fontSize: 20),
                            ),
                        SizedBox(height: 32,)
                          ] +
                          state.common
                              .map(
                                (e) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        addCubit.changeName(e);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        color: secondaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: "OpenSansSemiBold",
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
