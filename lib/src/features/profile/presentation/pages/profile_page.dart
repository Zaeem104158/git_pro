import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitPro/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:gitPro/src/features/profile/presentation/bloc/profile_event.dart';
import 'package:gitPro/src/features/profile/presentation/bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final username = _controller.text.trim();
                if (username.isNotEmpty) {
                  context.read<ProfileBloc>().add(FetchProfile(username));
                }
              },
              child: const Text('Get Github Profile'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileInitial) {
                  return const Center(
                    child: Text('Enter a username to search github users.'),
                  );
                } else if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else if (state is ProfileSuccess) {
                  final profile = state.profile;
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(profile.avatarUrl!),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            profile.name ?? "",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '@${profile.login}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          Text('Public Repos: ${profile.publicRepos}'),
                          Text('Followers: ${profile.followers}'),
                          Text('Following: ${profile.following}'),
                          const SizedBox(height: 8),
                          Text(
                            'Created: ${DateFormat.yMMMd().format(profile.createdAt!)}',
                          ),
                          Text(
                            'Updated: ${DateFormat.yMMMd().format(profile.updatedAt!)}',
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
