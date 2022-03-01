import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z/cubit/appCubit/appcubit.dart';
import 'package:z/cubit/appCubit/appcubitstats.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Image(
                  image: appCubit.get(context).isDark
                      ? AssetImage('assets/images/backgroundupperdraw.jpg')
                      : AssetImage('assets/images/backgroundupperdraw.png'),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: searchController,
                              keyboardType: TextInputType.text,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'search must not be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black45,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                                prefixIcon: Icon(Icons.search),
                                labelText: appCubit.get(context).isArbic
                                    ? "البحث:"
                                    : 'search:',
                              ),
                              onFieldSubmitted: (value) {
                                appCubit.get(context).getSearchVerses(value);
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, right: 12, top: 25),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: appCubit.get(context).isDark
                                ? Colors.white
                                : Color.fromARGB(255, 16, 15, 54),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Text(
                                            appCubit.get(context).search[index]
                                                ['text'],
                                            style: TextStyle(
                                                color:
                                                    appCubit.get(context).isDark
                                                        ? Colors.black
                                                        : Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20),
                                          ),
                                        ),
                                      );
                                    },
                                    physics: BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Container(
                                          height: 1,
                                          color:
                                              Color.fromARGB(255, 87, 89, 116),
                                        ),
                                      );
                                    },
                                    itemCount:
                                        appCubit.get(context).search.length),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
