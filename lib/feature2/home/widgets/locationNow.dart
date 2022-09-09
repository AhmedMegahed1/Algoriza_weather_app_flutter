// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LocationNow extends StatelessWidget {
  const LocationNow({
    Key? key,
    required this.locationName,
  }) : super(key: key);
  final String locationName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16.0,
        ),
        const Icon(
          Icons.location_pin,
          size: 12.0,
          color: Colors.white,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text(
          locationName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
