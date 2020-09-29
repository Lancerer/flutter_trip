import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> bannerList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 160,
          //设置banner
          child: get_banner(),
        )
      ],
    );
  }

  Widget get_banner() {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //点击banner跳转到相应的界面中
            },
            child: Image.network(bannerList[index], fit: BoxFit.fill,),
          );
        },
      ),
    );
  }
}
