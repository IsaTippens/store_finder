import 'package:flutter/material.dart';
import 'package:store_finder/search_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*CustomPaint(
          painter: BackgroundPainter(),
          size: MediaQuery.of(context).size,
        ),*/
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 2),
            Hero(
              tag: "logo",
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('images/canal_walk_full.png'),
              ),
            ),
            Spacer(flex: 1),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Hero(
                      tag: "search",
                      child: TextField(
                        onChanged: (out) {
                          setState(
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SearchPage(
                                      value: out,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        onSubmitted: (out) {
                          setState(() {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SearchPage(
                                value: out,
                              );
                            }));
                          });
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.search),
                            hintText: "Search for stores from A - Z"),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(flex: 4),
          ],
        ),
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black87;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5.0;

    //Bottom
    var path = Path()
      ..moveTo(size.width, size.height)
      ..cubicTo(size.width / 2, size.height * 3 / 4, size.width / 2,
          size.height * 3 / 4, 0, size.height);
    canvas.drawPath(path, paint);

    path = Path()
      ..moveTo(size.width, size.height)
      ..cubicTo(size.width * 3 / 4, size.height * 3 / 4, size.width / 2,
          size.height, 0, size.height);
    canvas.drawPath(path, paint);

    path = Path()
      ..moveTo(size.width, size.height)
      ..cubicTo(size.width / 2, size.height, size.width / 4,
          size.height * 3 / 4, 0, size.height);
    canvas.drawPath(path, paint);
    //Bottom

    //Top
    path = Path()
      ..moveTo(size.width, 0)
      ..cubicTo(size.width / 2, size.height / 4, size.width / 2,
          size.height / 4, 0, 0);
    canvas.drawPath(path, paint);

    path = Path()
      ..moveTo(size.width, 0)
      ..cubicTo(size.width * 3 / 4, size.height / 4, size.width * 3 / 4,
          size.height / 4, 0, 0);
    canvas.drawPath(path, paint);

    path = Path()
      ..moveTo(size.width, 0)
      ..cubicTo(size.width / 4, size.height / 4, size.width * 3 / 4,
          size.height / 4, 0, 0);
    canvas.drawPath(path, paint);
    //Top
  }

  @override
  bool shouldRepaint(CustomPainter old) => false;
}
