import 'package:first_app/Data/model/album.dart';
import 'package:first_app/Data/model/album2.dart';
import 'package:first_app/Data/model/user.dart';
import 'package:first_app/screens/pages/welocme_page.dart';
import 'package:first_app/screens/widgets/hero_widget.dart';
import 'package:first_app/services/album2_services.dart';
import 'package:first_app/services/album_service.dart';
import 'package:first_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<User>> _usersFuture;
  late Future<List<Album2>> _album2Future;

  @override
  void initState() {
    super.initState();
    _usersFuture = fetchUsers();
    _album2Future = fetchAlbum2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: HeroWidget(title: "Users", widget: WelcomePage()),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: FutureBuilder<List<User>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final user = snapshot.data![index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No users found.'));
                }
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: FutureBuilder<List<Album2>>(
              future: _album2Future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final album2 = snapshot.data![index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(album2.url),
                        ),
                        title: Text(album2.title),
                        subtitle: Text(album2.albumId.toString()),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No users found.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
