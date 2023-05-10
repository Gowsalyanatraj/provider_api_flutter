import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_call/model/pets.dart';
import 'package:provider_api_call/providers/pets_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetsProvider>(context);
    provider.getDataFromAPI();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 92, 92),
          title: const Text('Provider using API'),
          centerTitle: true,
        ),
        body: provider.isLoading
            ? getLoadingUI()
            : provider.error.isNotEmpty
                ? getErrorUI(provider.error)
                : getBodyUI(provider.pets));
  }

 Widget getLoadingUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SpinKitFadingCircle(
            color: Colors.blue,
            size: 80.0,
          ),
          Text('Loading....', style: TextStyle(color: Colors.blue))
        ],
      ),
    );
  }
}

Widget getErrorUI(String error) {
  return Center(
    child: Text(
      error,
      style: const TextStyle(color: Colors.red, fontSize: 22),
    ),
  );
}

Widget getBodyUI(Pets pets) {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),

      Expanded(
        child: ListView.builder(
            itemCount: pets.data.length,
            itemBuilder: (context, index) => ListTile(
              leading:CircleAvatar(
                radius: 22,
                backgroundImage:NetworkImage(pets.data[index].petImage),
                backgroundColor: Colors.grey,
              ) ,
                  title: Text(pets.data[index].userName),
                  trailing:pets.data[index].isFriendly ?const Icon(Icons.thumb_up,
                  color: Colors.blue,
                  ):const Icon(Icons.pets,
                  color: Colors.red) ,
                )),
      ),
    ],
  );
}
