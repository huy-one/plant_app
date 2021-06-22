import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/src/pages/theme/constrarts.dart';

import 'theme/icon_button_detail.dart';

class PlantDetails extends StatefulWidget {
  final dynamic plantTitle;

  const PlantDetails({Key? key, this.plantTitle}) : super(key: key);



  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  //iconbutton
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                    ),
                  ),
                  getIconButton(Icon(
                    Icons.wb_sunny_outlined,
                    color: primaryColor,
                    size: 45,
                  )),
                  getIconButton(Icon(Icons.thermostat_outlined,
                      color: primaryColor, size: 45)),
                  getIconButton(Icon(Icons.invert_colors_on_outlined,
                      color: primaryColor, size: 45)),
                  getIconButton(Icon(Icons.workspaces_outline,
                      color: primaryColor, size: 45)),
                ],
              )),
              //images
              Container(
                height: size.height * 0.8,
                width: size.width * 0.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(63),
                        bottomLeft: Radius.circular(63)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 60,
                          color: Colors.transparent.withOpacity(0.70))
                    ],
                    image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/img.png'))),
              ),
            ],
          ),
      Padding(
        padding: const EdgeInsets.only(
            top: defaultPadding * 3,
            left: defaultPadding,
            right: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: widget.plantTitle['title']+"\n",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: textColor, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: widget.plantTitle['country'],
                    style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w300,
                    ))
              ]),
            ),
            Text(
              widget.plantTitle['price'],
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: primaryColor),
            )
          ],
        ),
      )
        ],
      ),
    );
  }


}
