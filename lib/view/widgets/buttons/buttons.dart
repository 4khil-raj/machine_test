import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? image;
  final String? name;
  final double? textsize;
  final FontWeight? fontweight;
  final Color? color;
  final double? radius;
  final double? iconradius;
  // final Color? borderclr;
  final Color? textclr;
  final bool isNetwork;
  final bool isRow;
  final Function()? onTap;
  const CustomButton(
      {required this.isNetwork,
      this.iconradius,
      this.fontweight,
      super.key,
      this.height,
      this.textsize,
      required this.isRow,
      this.image,
      this.width,
      this.color,
      this.radius,
      this.textclr,
      this.onTap,
      this.name});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Align(
            alignment: Alignment.center,
            child: isRow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isNetwork
                          ? CircleAvatar(
                              radius: iconradius,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage('$image'),
                            )
                          : CircleAvatar(
                              radius: iconradius,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage('$image')),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        name!,
                        style: GoogleFonts.rubik(
                            fontWeight: fontweight,
                            color: textclr,
                            fontSize: textsize),
                      ),
                    ],
                  )
                : Text(
                    name!,
                    style: GoogleFonts.rubik(
                        color: textclr,
                        fontSize: textsize,
                        fontWeight: fontweight),
                  )),
      ),
    );
  }
}
