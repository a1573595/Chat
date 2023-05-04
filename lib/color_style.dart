import 'dart:ui';

class ColorStyle {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color.fromARGB(255, 117, 126, 149);
  static const Color greyAccent = Color.fromARGB(255, 230, 230, 230);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF2979FF);
  static const Color blueGrey = Color(0xFF75BBFF);
  static const Color blueDark = Color.fromARGB(255, 52, 80, 105);
  static const Color blueChetwode = Color.fromARGB(255, 102, 103, 171);
  static const Color purpleAccent = Color(0xFFD500F9);
  static const Color purple = Color.fromARGB(255, 187, 137, 190);
  static const Color green = Color(0xFF95EC5F);
  static const Color greenDark = Color(0xFF41D23E);
  static const Color greenAccent = Color.fromARGB(255, 0, 255, 162);
  static const Color greenNiagara = Color.fromARGB(255, 44, 181, 169);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color orange = Color.fromARGB(255, 249, 186, 92);
  static const Color deepOrange = Color(0xFFF4511E);
  static const Color red = Color(0xFFDC2626);

  /// 其他
  static const Color backgroundColor = white;
  static const Color dialogBackgroundColor = Color(0x8A000000);
  static const Color disabledBackgroundColor = Color.fromARGB(255, 229, 231, 235);
  static const Color appBarColor = Color.fromARGB(255, 249, 249, 249);
  static const Color borderColor = Color.fromARGB(255, 209, 213, 219);
  static const Color uploadColor = purple;
  static const Color downloadColor = green;

  static const List<Color> rainbowColor = [
    ColorStyle.red,
    ColorStyle.orange,
    ColorStyle.yellow,
    ColorStyle.green,
    ColorStyle.blue,
    ColorStyle.purpleAccent
  ];

  static const List<Color> rfNoiseLevelColor = [
    ColorStyle.blue,
    ColorStyle.greenNiagara,
    ColorStyle.green,
    ColorStyle.orange,
    ColorStyle.red,
  ];

  static const List<Color> rfSignalNoiseColor = [
    ColorStyle.red,
    ColorStyle.orange,
    ColorStyle.green,
    ColorStyle.greenNiagara,
    ColorStyle.blue,
  ];

  static const List<Color> siteSurveyChartColor = [
    Color(0xFFDC9FB4),
    Color(0xFFFFE994),
    Color(0xFFA8D8B9),
    Color(0xFF5BB2DC),
    Color(0xFFD34778),
    Color(0xFFFFC408),
    Color(0xFFA4C2AA),
    Color(0xFF1D88A8),
    Color(0xFFAB3B3A),
    Color(0xFFE8B647),
    Color(0xFF00896C),
    Color(0xFF006284),
    Color(0xFFD0104C),
    Color(0xFFAEB16C),
    Color(0xFF2D6D4B),
    Color(0xFF08192D),
    Color(0xFF9F353A),
    Color(0xFFCDE4AE),
    Color(0xFFA5DEE4),
    Color(0xFF6982B7),
    Color(0xFFFBD095),
    Color(0xFF86C166),
    Color(0xFF66BAB7),
    Color(0xFF005CAF),
    Color(0xFFF6AC49),
    Color(0xFF4A593D),
    Color(0xFF33A6B8),
    Color(0xFF986DB2),
    Color(0xFFF05E1C),
    Color(0xFF24483A),
    Color(0xFF0D5661),
    Color(0xFF572A3F),
  ];
}
