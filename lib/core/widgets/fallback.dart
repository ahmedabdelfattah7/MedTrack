import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medtrack/core/utils/asset_manger.dart';

class FallBack extends StatelessWidget {
  const FallBack({super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageManger.thereIsNoData,
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 16),
                Text(
                  'Oops! No data available. Come back later or add some fresh insights',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Positioned(
              bottom: 35,
              right: 16,
              child: FloatingActionButton(
                onPressed: onPressed,
                child: const Icon(FontAwesomeIcons.heartCirclePlus),
              ),
            ),
          ],
        ),
      ),
    );
  }
}