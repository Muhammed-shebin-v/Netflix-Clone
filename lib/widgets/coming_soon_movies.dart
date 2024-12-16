import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ComingSoonMovies extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  const ComingSoonMovies(
      {super.key,
      required this.imageUrl,
      required this.overview,
      required this.logoUrl,
      required this.month,
      required this.day});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                month,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    letterSpacing: 5),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: imageUrl),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.2,
                    child: CachedNetworkImage(
                      imageUrl: logoUrl,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  const Gap(10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_none_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      Gap(10),
                      Text(
                        "Remind me ",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  const Gap(20),
                  const Column(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      Gap(10),
                      Text(
                        "info ",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coming on $month $day",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    overview,
                    maxLines: 4,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey),
                  ),
                ],
              ),
 Gap(50)
            ],
          )
          ),
        ],
      
      ),
      
    );
  }
}
