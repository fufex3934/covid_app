import 'package:flutter/material.dart';


class CountryDropDown extends StatelessWidget {

  final List<String>countries;
  final String country;
  final void Function(String?)onChanged;
  const CountryDropDown({super.key,
    required this.countries,
    required this.country,
    required this.onChanged
});


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countries.map<DropdownMenuItem<String>>((String e) {
            return DropdownMenuItem(
              value: e,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Image.asset(
                      'assets/images/${e.toLowerCase()}_flag.png',
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Text(
                    e,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }
}
