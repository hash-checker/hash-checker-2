import 'package:flutter/material.dart';
import 'package:hash_checker_2/data/repositories/settings/api/settings_repository.dart';
import 'package:hash_checker_2/data/repositories/settings/impl/settings_repository_impl.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatelessWidget {
  final Widget app;

  const AppDependencies({
    super.key,
    required this.app,
  });

  @override
  Widget build(BuildContext context) {
    return Provider<SettingsRepository>(
      create: (_) => SettingsRepositoryImpl(),
      builder: (context, _) {
        // TODO: refactor
        return FutureBuilder<void>(
          future: context.read<SettingsRepository>().load(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return app;
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
