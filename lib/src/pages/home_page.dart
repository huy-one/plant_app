import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/app.dart';
import 'package:plant_app/src/json/plant_json.dart';
import 'package:plant_app/src/pages/plant_details.dart';
import 'components/header_with_searchbox.dart';
import 'theme/constrarts.dart';
import 'theme/title_with_custom_under_line.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: getBody(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  Container MyBottomNavBar() {
    return Container(
      padding: EdgeInsets.only(
          left: defaultPadding * 2,
          right: defaultPadding * 2,
          bottom: defaultPadding),
      height: 80,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, -10),
          blurRadius: 30,
          color: primaryColor.withOpacity(0.38),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.stream)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.house_rounded)),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        HeaderWithSearch(
          size: size,
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: defaultPadding, left: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleWithUnderLine(text: "Recomended"),
              FlatButton(
                minWidth: 100,
                height: 50,
                color: primaryColor,
                child: Text(
                  'More',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(plants.length, (index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: defaultPadding,
                      top: defaultPadding / 2,
                      bottom: defaultPadding * 2.5),
                  width: size.width * 0.4,
                  child: Column(
                    children: [
                      Image(
                        image: ExactAssetImage(plants[index]['img']),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PlantDetails(plantTitle: plants[index],)));
                        },
                        child: Container(
                          padding: EdgeInsets.all(defaultPadding / 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: primaryColor.withOpacity(0.23),
                                )
                              ]),
                          child: Row(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: plants[index]['title'] +
                                        "\n".toUpperCase(),
                                    style: Theme.of(context).textTheme.button),
                                TextSpan(
                                    text:
                                        plants[index]['country'].toUpperCase(),
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(0.5))),
                              ])),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  plants[index]['price'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .button!
                                      .copyWith(color: primaryColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }))),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: defaultPadding, left: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleWithUnderLine(text: "Featured Plants"),
              FlatButton(
                minWidth: 100,
                height: 50,
                color: primaryColor,
                child: Text(
                  'More',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(bottom_plants.length, (index) {
            return Container(
              margin: EdgeInsets.only(
                  left: defaultPadding,
                  top: defaultPadding / 2,
                  right: defaultPadding),
              width: size.width * 0.8,
              height: 185,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(bottom_plants[index]['img']),
                  )),
            );
          })),
        )
      ]),
    );
  }
}
