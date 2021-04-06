import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'ReusableCard.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inActiveCardColour = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  void updateColour(Gender selectedGender) {
    selectedGender == Gender.male ? toggleMale() : toggleFemale();
  }

  void toggleMale() {
    if (maleCardColour == inActiveCardColour) {
      maleCardColour = activeCardColour;
      femaleCardColour = inActiveCardColour;
    } else {
      maleCardColour = inActiveCardColour;
    }
  }

  void toggleFemale() {
    if (femaleCardColour == inActiveCardColour) {
      femaleCardColour = activeCardColour;
      maleCardColour = inActiveCardColour;
    } else {
      femaleCardColour = inActiveCardColour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        toggleMale();
                      });
                    },
                    colour: maleCardColour,
                    cardChild:
                        IconContent(label: 'MALE', icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        toggleFemale();
                      });
                    },
                    colour: femaleCardColour,
                    cardChild: IconContent(
                        label: 'FEMALE', icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: activeCardColour),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColour),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
