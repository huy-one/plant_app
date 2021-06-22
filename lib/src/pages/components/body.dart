import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/pages/components/header_with_searchbox.dart';
import 'package:plant_app/src/pages/theme/constrarts.dart';
import 'package:plant_app/src/pages/theme/recomend_plant_card.dart';
import 'package:plant_app/src/pages/theme/title_with_custom_under_line.dart';
import 'package:plant_app/src/json/plant_json.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
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
          child: getListPlants(),
        )
      ]),
    );
  }

  Widget getListPlants() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(plants.length, (index) {
          return RecomendPlantCard(
              image: plants[index]["img"],
              title: plants[index]["title"],
              country: plants[index]["country"],
              price: plants[index]["price"],
              press: () {});
        })));
  }
}
