import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:z/cache_helper/cache_helper.dart';
import 'package:z/screens/homescreen.dart';
class boardingModel{
  final String image,title,body;
  boardingModel({this.body,this.image,this.title});
}

class OnBording extends StatefulWidget {
  @override
  _OnBordingState createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  @override
  bool isLast=false;
  Widget build(BuildContext context) {

    var pageController=PageController();
    List<boardingModel> bording=[
      boardingModel(image: 'assets/images/icon.png',
          title: "title 1",body: "body 1"
      ),
      boardingModel(image: 'assets/images/icon.png',
          title: "title 2",body: "body 2"
      ),
      boardingModel(image: 'assets/images/icon.png',
          title: "title 3",body: "body 3"
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [TextButton(onPressed: (){
          submit();
        }, child: Text('SKIP',style: TextStyle(
            color: Colors.deepPurple,fontWeight: FontWeight.bold
        ),))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  if(index==bording.length-1){
                    setState(() {
                      isLast=true;
                      print('last');
                    });

                  }else{
                    setState(() {
                      isLast=false;
                      print('not last');
                    });

                  }

                },
                controller: pageController,
                itemCount: 3,itemBuilder:
                  (context,index)=>
                  BuildBordingItem(bording[index]),
                physics: BouncingScrollPhysics(),
              ),
            ),
            SizedBox(height: 40,),
            Row(children: [
              SmoothPageIndicator(controller: pageController, count: bording.length,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5.0,
                    expansionFactor: 4.0,
                    activeDotColor: Colors.deepPurple

                ),

              ),
              Spacer(),
              FloatingActionButton(onPressed: (){
                isLast?
                submit()
                    :

                pageController.nextPage(duration: Duration(
                    milliseconds: 1000
                ), curve: Curves.slowMiddle);



              },
                child: Icon(
                    Icons.arrow_forward_ios
                ),)
            ],
            ),




          ],
        ),
      ),

    );
  }

  Widget BuildBordingItem(boardingModel model)=>
      Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage(model.image))),
          SizedBox(height: 15,),
          Text(model.title,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0
          ),),
          SizedBox(height: 15,),
          Text(model.body,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0
          ),),

        ],
      );
  void submit(){
    cacheHelper.Putbool(key: "OnBoarding", value: true).then((value) => {
      if(value)
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context)=>HomeScreen())
            , (route) => false)


    });



  }
}