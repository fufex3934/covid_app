import '../config/palette.dart';
import '../widgets/country_drop_down.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = "USA";
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight)
        ],

      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                    'COVID-19',
                  style: TextStyle(
                          color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
                CountryDropDown(
                    countries: const ['CN','FR','IN','UK','USA'],
                    country: _country,
                    onChanged: (val){
                      setState(() {
                        _country = val!;
                      });
                    }
                ),
              ],
            ),
            SizedBox(height: screenHeight*0.03,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                    'Are You Feeling Sick?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                  ),
                ),
                SizedBox(height: screenHeight*0.01,),
                const Text(
                    'if you feel sick with any covid-19 syptoms,please call or text us immediatly for help',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                  ),
                ),
                SizedBox(height: screenHeight*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: (){},
                        icon: const Icon(
                            Icons.phone,
                          color: Colors.white,
                        ),
                        label: const Text('Call Now'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20
                        )
                      ),
                    ),
                    TextButton.icon(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: const Text('Send SMS'),
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20
                          )
                      ),
                    ),
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
  SliverToBoxAdapter _buildPreventionTips(screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
                'Prevention Tips',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );

  }
}
