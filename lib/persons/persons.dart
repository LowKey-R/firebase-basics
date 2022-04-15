import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_basic/profile/profile.dart';
import 'package:flutter/material.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({Key? key}) : super(key: key);

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Data'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('persons').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Data Tidak Ditemukan ...'),
            );
          }
          QuerySnapshot personData = snapshot.data!;
          return ListView.builder(
            itemCount: personData.docs.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(personData.docs[index].get('firstName') +
                    ' ' +
                    personData.docs[index].get('lastName')),
                subtitle: Text(personData.docs[index].get('phoneNumber')),
                onTap: () {
                  Navigator.of(context).pushNamed('/profile');
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
