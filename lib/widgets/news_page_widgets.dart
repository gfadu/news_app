import 'package:flutter/material.dart';

class BottomButtonsRow extends StatelessWidget {
  final Function setPage;
  final String selectePage;
  const BottomButtonsRow(this.setPage, this.selectePage);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            bottomButtons(context, 'News', Icons.menu, Colors.white,
                () => setPage("News"), selectePage),
            SizedBox(
              width: 5,
            ),
            bottomButtons(context, "Favs", Icons.favorite, Colors.pink,
                () => setPage("Favs"), selectePage),
          ],
        ),
      ),
    );
  }
}

Widget bottomButtons(context, text, icon, iconcolor, setPage, selectedPage) {
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor:
                selectedPage == text ? Color(0xff4267B2) : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: selectedPage == text ? Colors.white : Colors.pink),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: selectedPage == text ? Colors.white : Colors.blue,
              ),
            )
          ],
        ),
        onPressed: setPage,
      ),
    ),
  );
}
