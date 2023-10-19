import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Page(),
    );
  }
}
class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  final List<String> _arr=List.generate(9, (index) => index==0?'':index.toString());
  final List _images=[
    '',
    'assests/images/img1.png',
    'assests/images/img2.png',
    'assests/images/img3.png',
    'assests/images/img4.png',
    'assests/images/img5.png',
    'assests/images/img6.png',
    'assests/images/img7.png',
    'assests/images/img8.png',
  ];
  _change(int i)
  {
    int _empty=_arr.lastIndexOf('');
    int _previtem=i-1;
    int _nextitem=i+1;
    int _prevrow=i-3;
    int _nextrow=i+3;
    if(_empty==_previtem)
    {
      _arr[_previtem]=_arr[i];
      _arr[i]='';
      _images[_previtem]=_images[i];
      _images[i]='';
    }
    else if(_empty==_nextitem)
    {
      _arr[_nextitem]=_arr[i];
      _arr[i]='';
      _images[_nextitem]=_images[i];
      _images[i]='';
    }
    else if(_empty==_prevrow)
    {
      _arr[_prevrow]=_arr[i];
      _arr[i]='';
      _images[_prevrow]=_images[i];
      _images[i]='';
    }
    else if(_empty==_nextrow)
    {
      _arr[_nextrow]=_arr[i];
      _arr[i]='';
      _images[_nextrow]=_images[i];
      _images[i]='';
    }
    setState(() {

    });
  }
  @override
  void initState()
  {
    bool flag=false;
    while(!flag) {
      generate();
      var cnt=0,i,j;
      for(i=0;i<8;i++)
        for(j=0;j<i;j++)
          {
            var va1=(_arr[j]=='')?0:int.parse(_arr[j]),va2=(_arr[i]=='')?0:int.parse(_arr[i]);
            if(va1>va2) cnt++;
          }
      if(cnt%2==0) flag=true;
    }
    super.initState();
  }
  generate()
  {
    var ran=Random(),n=8;
    while(n>1)
    {
      var val=ran.nextInt(n--);
      var tmp=_arr[val];
      _arr[val]=_arr[n];
      _arr[n]=tmp;
      var tmp2=_images[val];
      _images[val]=_images[n];
      _images[n]=tmp2;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: AspectRatio(
            aspectRatio: 1,
            child: GridView.count(crossAxisCount: 3,
            children: [
              for(int i=0;i<9;i++)
                InkWell(
                  onTap: (){ _change(i); },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(_images[i]),
                            fit: BoxFit.cover)),
                  ),
                )
            ],),
          ),
        ),
      )
    );
  }
}

