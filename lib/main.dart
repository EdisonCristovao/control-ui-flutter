import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smarthome/config.dart';
import 'package:smarthome/menuWidget.dart';
import 'package:smarthome/menu_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: <Widget>[
          MenuWidget(),
          MyHomePage(isPressed: isPressed),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  bool isPressed;
  MyHomePage({Key key, this.isPressed}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double _value = 2;
  final Duration duracao = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duracao);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: duracao,
      top: 0,
      right: widget.isPressed ? screenWidth * -0.4 : 0,
      bottom: 0,
      left: widget.isPressed ? screenWidth * 0.6 : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                topBar(),
                SizedBox(height: 24),
                Container(
                  height: 140,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      listItem1(),
                      listItem1(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                circularTemplateSlider(),
                SizedBox(height: 20),
                Text(
                  'Controle do Fan',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                SizedBox(height: 20),
                Slider(
                  value: _value,
                  max: 5,
                  min: 0,
                  divisions: 5,
                  activeColor: activeColor1,
                  onChanged: (newValue) {
                    setState(() {
                      _value = newValue;
                    });
                  },
                  label: _value.toString(),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.width * 0.4 + 32,
                  child: StaggeredGridView.count(
                    crossAxisCount: 5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    staggeredTiles: [
                      StaggeredTile.count(2, 2),
                      StaggeredTile.count(1, 1),
                      StaggeredTile.count(1, 1),
                      StaggeredTile.count(1, 1),
                      StaggeredTile.count(1, 1),
                      StaggeredTile.count(1, 1),
                      StaggeredTile.count(1, 1),
                    ],
                    children: <Widget>[
                      mainIconMenu(),
                      MenuItemWidget(iconName: Icons.monetization_on),
                      MenuItemWidget(iconName: Icons.wb_sunny),
                      MenuItemWidget(iconName: Icons.settings),
                      MenuItemWidget(iconName: Icons.data_usage),
                      MenuItemWidget(iconName: Icons.tap_and_play),
                      MenuItemWidget(iconName: Icons.assessment),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mainIconMenu() {
    return ClayContainer(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      color: primaryColor,
      borderRadius: 12,
      child: Center(
        child: Icon(
          Icons.power_settings_new,
          color: activeColor2,
          size: 80,
        ),
      ),
    );
  }

  Widget circularTemplateSlider() {
    return ClayContainer(
      height: 200,
      width: 200,
      borderRadius: 200,
      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              progressBarColors: gradientColors,
              hideShadow: true,
              shadowColor: Colors.transparent,
            ),
            infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
              modifier: (double value) {
                final roudedValue = value.ceil().toInt().toString();
                return '$roudedValue \u2103';
              },
            ),
          ),
          onChange: (double value) {
            print(value);
          },
        ),
      ),
    );
  }

  Widget listItem1() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ClayContainer(
        width: MediaQuery.of(context).size.width * 0.7,
        borderRadius: 12,
        color: primaryColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [activeColor1, activeColor2],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              leading: Icon(
                Icons.tablet,
                color: Colors.white,
                size: 34,
              ),
              title: Text(
                'Ar Condicionado',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              subtitle: Text(
                'Philco(65) AX-500',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClayContainer(
            borderRadius: 10,
            color: primaryColor,
            child: FlatButton(
              padding: const EdgeInsets.all(4),
              onPressed: () {
                setState(() {
                  if (!widget.isPressed)
                    _controller.forward();
                  else
                    _controller.reverse();

                  widget.isPressed = !widget.isPressed;
                });
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          Text(
            "Smart Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          ClayContainer(
            borderRadius: 10,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
