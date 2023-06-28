import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/screens/add_child/add_child_cubit.dart';
import 'package:familyapp/screens/collaborate_with_partener/common_names_screen.dart';
import 'package:familyapp/screens/collaborate_with_partener/entering_name_cubit.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:familyapp/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_tag_editor/tag_editor.dart';

import '../../colors.dart';

class EnteringNameScreen extends StatelessWidget {
  final AddChildCubit addCubit;
  late EnteringNameCubit cubit;

  EnteringNameScreen({Key? key, required this.addCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        cubit = EnteringNameCubit()
          ..init(context.read<FamilyBloc>().state.family,
              context.read<UserLogicBloc>().state.user.id);
        return cubit;
      },
      child: BlocBuilder<EnteringNameCubit, EnteringNameState>(
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
              title: const Center(
                child: Text(
                  "Enter your ideas for the names",
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: "OpenSansSemiBold",
                      fontSize: 20),
                ),
              ),
              backgroundColor: secondaryColor,
            ),
            body: state.state == EnteringNameScreenState.loading
                ? const Center(child: LoadingWidget())
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TagEditor(
                          length: state.names.length,
                          delimiters: [',', ' '],
                          hasAddButton: true,
                          inputDecoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Hint Text...',
                          ),
                          onTagChanged: (newValue) {
                            context.read<EnteringNameCubit>().addName(newValue);
                          },
                          tagBuilder: (context, index) => _Chip(
                            index: index,
                            label: state.names[index],
                            onDeleted: () => context
                                .read<EnteringNameCubit>()
                                .deleteName(index),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ButtonWidget(
                          text: "Done",
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommonNamesScreen(
                                          names: state.names,
                                          addCubit: addCubit,
                                        )));
                            Navigator.pop(context);
                          })
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final Function onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: secondaryColor,
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(
        label,
        style: TextStyle(fontFamily: "OpenSansSemiBold", fontSize: 20),
      ),
      deleteIcon: Icon(
        Icons.close,
        size: 22,
      ),
      onDeleted: () {
        onDeleted();
      },
    );
  }
}
