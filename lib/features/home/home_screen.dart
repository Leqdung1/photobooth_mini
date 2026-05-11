import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photobooth_mini/di/injection.dart';
import 'package:photobooth_mini/features/photo_session/presentation/cubit/photo_session_cubit.dart';
import 'package:photobooth_mini/features/photo_session/presentation/pages/photo_session_page.dart';


class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoSessionCubit>(
      create: (_) => sl<PhotoSessionCubit>(),
      child: const PhotoSessionPage(),
    );
  }
}
