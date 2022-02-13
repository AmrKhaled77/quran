import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/cubit/appCubit/appcubitstats.dart';
import 'package:z/screens/quran/reading_item.dart';

class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit,ThemeStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(0, 0, 0, 0),
            ),
            body: Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/backgroundupperdraw.png'),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(

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
                          onChanged: (value){
                            appCubit.get(context).getSearchVerses(value);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child:   ListView.separated(itemBuilder: (context,index){

                        return  Text(appCubit.get(context).search[index]['text']);

                      },

                          physics: BouncingScrollPhysics(),

                          separatorBuilder: (context,index){

                            return  Padding(

                              padding: const EdgeInsets.symmetric(horizontal: 12.0),

                              child: Container(

                                height: 1,

                                color: Color.fromARGB(255, 87, 89, 116),

                              ),

                            );

                          },

                          itemCount: appCubit.get(context).search.length),
                    )

                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}
