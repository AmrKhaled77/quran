import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(

              controller: searchController,
              keyboardType: TextInputType.text,
              validator: (String value){
                if(value.isEmpty){
                  return 'search must not be empty';
                }return null;
              },
              decoration: InputDecoration(
                prefixIcon:Icon(Icons.search),
                labelText: 'search',
              ),


            ),
          )
        ],
      ),
    );
  }
}
