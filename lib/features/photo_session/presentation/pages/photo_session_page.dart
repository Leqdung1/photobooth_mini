import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/photo_session_cubit.dart';
import '../cubit/photo_session_state.dart';

class PhotoSessionPage extends StatefulWidget {
  const PhotoSessionPage({super.key});

  @override
  State<PhotoSessionPage> createState() => _PhotoSessionPageState();
}

class _PhotoSessionPageState extends State<PhotoSessionPage> {
  @override
  void initState() {
    super.initState();
    context.read<PhotoSessionCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Session')),
      body: Center(
        child: BlocBuilder<PhotoSessionCubit, PhotoSessionState>(
          builder: (BuildContext context, PhotoSessionState state) {
            if (state.status == PhotoSessionStatus.loading) {
              return const CircularProgressIndicator();
            }

            if (state.status == PhotoSessionStatus.failure) {
              return Text(state.errorMessage ?? 'Unexpected error');
            }

            if (state.status == PhotoSessionStatus.success && state.session != null) {
              final session = state.session!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    session.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text('Session ID: ${session.id}'),
                  Text('Shots planned: ${session.shotCount}'),
                ],
              );
            }

            return const Text('Loading session...');
          },
        ),
      ),
    );
  }
}
