import 'package:flutter/material.dart';

class AddButtonModal extends StatelessWidget {
  const AddButtonModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Start creating now',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20,),
              Column(
                children: [
                  IconButton.filledTonal(
                    isSelected: false,
                    iconSize: 30,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_rounded, 
                      color: Theme.of(context).colorScheme.primary
                    ), 
                    padding: const EdgeInsets.all(15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Favorites',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30,),
              Column(
                children: [
                  IconButton.filledTonal(
                    isSelected: false,
                    iconSize: 30,
                    onPressed: () {}, 
                    icon: Icon(
                      Icons.bookmark_added_outlined,
                      color: Theme.of(context).colorScheme.primary
                    ), 
                    padding: const EdgeInsets.all(15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Boards',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ]
          ),
        ],
      ),
    );
  }
}
