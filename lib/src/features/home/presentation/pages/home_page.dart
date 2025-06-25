import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/repos_bloc.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/repos_event.dart';
import 'package:point_of_sale/src/features/home/presentation/bloc/repos_state.dart';
import 'package:point_of_sale/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:point_of_sale/src/features/profile/presentation/bloc/profile_state.dart';
import 'package:url_launcher/url_launcher.dart';

class ReposPage extends StatefulWidget {
  const ReposPage({super.key});

  @override
  State<ReposPage> createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final profileState = context.read<ProfileBloc>().state;
      if (profileState is ProfileSuccess) {
        final username = profileState.profile.login;
        context.read<ReposBloc>().add(FetchRepos(username!));
      }
      _isInitialized = true; // prevent re-execution
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repositories'), centerTitle: true),
      body: BlocBuilder<ReposBloc, ReposState>(
        builder: (context, state) {
          if (state is ReposLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReposFailure) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is ReposSuccess) {
            final repos = state.githubReposResponseEntityList;

            if (repos.isEmpty) {
              return const Center(child: Text('No repositories found.'));
            }

            return ListView.builder(
              itemCount: repos.length,
              itemBuilder: (context, index) {
                final repo = repos[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse(
                        '${repo.gitRepoUrl!.replaceFirst("git://", 'https://')}',
                      );
                      if (!await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(repo.name ?? 'Unnamed Repo'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (repo.description != null)
                              Text(repo.description!),
                            const SizedBox(height: 4),
                            Text('Language: ${repo.language ?? "Unknown"}'),
                            Text(
                              'Created: ${DateFormat.yMMMd().format(repo.createdAt!)}',
                            ),
                            Text(
                              'Updated: ${DateFormat.yMMMd().format(repo.createdAt!)}',
                            ),
                            Text(
                              'Pushed: ${DateFormat.yMMMd().format(repo.createdAt!)}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink(); // Initial state
        },
      ),
    );
  }
}
