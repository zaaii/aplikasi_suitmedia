import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/presentation/API/user.dart';
import 'package:aplikasi/presentation/API/user_bloc.dart';
import 'package:aplikasi/presentation/API/user_repository.dart';

class third_page extends StatefulWidget {
  final Function(String)? onUserNameSelected; // Define the named parameter

  third_page({this.onUserNameSelected});
  @override
  _third_pageState createState() => _third_pageState();
}

class _third_pageState extends State<third_page> {
  UserBloc _userBloc = UserBloc(UserRepository());

  @override
  void initState() {
    super.initState();
    _userBloc.getUsers();
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Third Screen'),
      ),
      child: StreamBuilder<List<User>>(
        stream: _userBloc.userListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userList = snapshot.data!;
            return Material(
              child: RefreshIndicator(
                onRefresh: () async {
                  _userBloc.refreshUsers();
                },
                child: ListView.builder(
                  itemCount: userList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == userList.length) {
                      return _buildLoaderIndicator();
                    }
                    final user = userList[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                            radius: 30.0,
                          ),
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          onTap: () {
                            if (widget.onUserNameSelected != null) {
                              widget.onUserNameSelected!(user.name);
                            }
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(indent: 20.0),
                      ],
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildLoaderIndicator() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
