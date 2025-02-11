import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int order;

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      this.order = 0,
      this.isInverted = false});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -order * 20),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isInverted ? Colors.white : Color(0xFF1F2133),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: isInverted ? Colors.black : Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          amount,
                          style: TextStyle(
                            color: isInverted ? Colors.black : Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          code,
                          style: TextStyle(
                            color: isInverted
                                ? Colors.black.withValues(alpha: 0.7)
                                : Colors.white.withValues(alpha: 0.7),
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 2,
                  child: Transform.translate(
                    offset: Offset(0, 12),
                    child: Icon(
                      icon,
                      color: isInverted ? Colors.black : Colors.white,
                      size: 100,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
