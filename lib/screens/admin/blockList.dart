import 'package:carparking/model/user.model.dart';
import 'package:carparking/services/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BlocList extends StatelessWidget {
  const BlocList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: const Text('Block List'),
      ),
      body: Container(
        child: FutureBuilder<List<UserModel>?>(
            future: DataBase.getBlackListedUsers(context),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snap.data?.length == 0) {
                return Center(
                  child: Text('No BlockList found'),
                );
              }
              return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                    itemCount: snap.data?.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('email : ${snap.data?[index].email}'),
                      leading: const Icon(Icons.person, color: Colors.blue),
                      // trailing: Icon(Icons.arrow_right_rounded, color: Colors.blue),
                    ),
                  ));
            }),
      ),
    ));
  }
}
