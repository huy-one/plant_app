import 'package:flutter/material.dart';
import 'package:plant_app/src/pages/theme/constrarts.dart';
class HeaderWithSearch extends StatelessWidget {
   final Size size;

  const HeaderWithSearch({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      // it will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: defaultPadding,right: defaultPadding,bottom: 36+defaultPadding),
            height: size.height * 0.2 - 27,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Welcome to onehe!',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
                ),
                // Spacer(),
                Icon(Icons.data_usage,color: Colors.white,size: 40,)
              ],
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: defaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: primaryColor.withOpacity(0.23),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'SEARCH',
                    hintStyle: TextStyle(
                      color: primaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.search,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),

          ),

        ],
      ),
    );
  }
}
