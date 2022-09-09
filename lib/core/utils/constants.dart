import 'package:flutter/material.dart';

const String apiKey = "d5a27f5120235d8110edf6c22ce771d9";
navigateAndRemove({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) {
      return page;
    }),
    (page) => false,
  );
}

navigate({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return page;
  }));
}
getWeatherIcon(int id) {
  if (id < 300) {
    return '🌩';
  } else if (id < 400) {
    return '🌧';
  } else if (id < 600) {
    return '☔️';
  } else if (id < 700) {
    return '☃️';
  } else if (id < 800) {
    return '🌫';
  } else if (id == 800) {
    return '☀️';
  } else if (id <= 804) {
    return '☁️';
  } else {
    return ' ';
  }
}


showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 20, 3, 95),
          content: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 20, 3, 95),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 10.0,
        ),
      )
      .close;
}

int round(dynamic value) {
  return value.round();
}

