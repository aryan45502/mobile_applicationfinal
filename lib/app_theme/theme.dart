// import 'package:flutter/material.dart';

// final ThemeData appTheme = ThemeData(
//   primaryColor: const Color(0xFF800000), // Maroon Color
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Color(0xFF800000),
//     foregroundColor: Colors.white,
//     elevation: 0,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: const Color(0xFF800000),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//     ),
//   ),
// );

// import 'package:flutter/material.dart';

// final ThemeData appTheme = ThemeData(
//   primaryColor: const Color(0xFF800000), // Maroon Color
//   scaffoldBackgroundColor:
//       Colors.grey[200], // Light grey background for the app
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Color(0xFF800000),
//     foregroundColor: Colors.white,
//     elevation: 0,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.orange, // Orange button background color
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       textStyle: const TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//         color: Colors.white, // White text color for better contrast
//       ),
//     ),
//   ),
// );

// import 'package:flutter/material.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//       scaffoldBackgroundColor: const Color.fromARGB(255, 226, 150, 240),
//       fontFamily: "Montserrat Regular",
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//               textStyle: const TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w300,
//                   fontFamily: 'Montserrat Bold'),
//               backgroundColor: Colors.purple,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5)))),
//       inputDecorationTheme: const InputDecorationTheme(
//           contentPadding: EdgeInsets.all(15),
//           border: OutlineInputBorder(),
//           labelStyle: TextStyle(
//             fontSize: 20,
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.orange,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(),
//           )),
//       appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           titleTextStyle: TextStyle(
//             color: Colors.purple,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           )));
// }

// import 'package:flutter/material.dart';

// final ThemeData appTheme = ThemeData(
//   // Define the primary color (maroon) and background color (white)
//   primaryColor: const Color(0xFF800000), // Maroon color
//   scaffoldBackgroundColor: Colors.white,

//   // AppBar theme
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Color(0xFF800000), // Maroon
//     foregroundColor: Colors.white, // Text color for AppBar
//     elevation: 0,
//   ),

//   // Text theme
//   textTheme: const TextTheme(
//     displayLarge: TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//       color: Color(0xFF800000), // Maroon
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 16,
//       color: Colors.grey,
//     ),
//   ),

//   // ElevatedButton theme
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: const Color(0xFF800000), // Maroon
//       foregroundColor: Colors.white, // Button text color
//       textStyle: const TextStyle(fontSize: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
//   ),

//   // Color scheme
//   colorScheme: ColorScheme.fromSwatch().copyWith(
//     primary: const Color(0xFF800000), // Maroon
//     secondary: Colors.grey,
//     surface: Colors.white,
//   ),
// );

import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'MontserratAlternates-Regular',
  primaryColor: const Color(0xFF800000), // Maroon Color
  scaffoldBackgroundColor:
      Colors.grey[200], // Light grey background for the app
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF800000),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor:
          const Color(0xFF800000), // Maroon button background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        // White text color for better contrast
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white, // White background for the text fields
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), // Rounded border
      borderSide: BorderSide(
        color: Colors.grey.shade400, // Light grey border
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey.shade400,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color(0xFF800000), // Maroon color for focused border
        width: 2,
      ),
    ),
    labelStyle: const TextStyle(
      color: Colors.grey, // Grey color for the label text
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontFamily: 'Montserrat Bold', // Grey color for hint text
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 12,
    ),
  ),
);
