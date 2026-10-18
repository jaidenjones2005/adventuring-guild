
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adventurer.dart';
import 'party_model.dart';

class GuildHallRoster extends StatelessWidget {
  const GuildHallRoster({super.key});

  static final List<Adventurer> availableAdventurers = [
    Adventurer(
      name: 'Aria Ironheart',
      role: 'Knight',
      goldCost: 150,
    ),
    Adventurer(
      name: 'Eldrin Starweaver',
      role: 'Mage',
      goldCost: 200,
    ),
    Adventurer(
      name: 'Lyra Swiftfoot',
      role: 'Rogue',
      goldCost: 120,
    ),
    Adventurer(
      name: 'Brakka Oakshield',
      role: 'Paladin',
      goldCost: 180,
    ),
    Adventurer(
      name: 'Zephyr Whisperwind',
      role: 'Ranger',
      goldCost: 140,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: availableAdventurers.length,
      itemBuilder: (context, index) {
        final adventurer = availableAdventurers[index];

        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          child: ListTile(
            leading: const Icon(
              Icons.shield,
              color: Colors.deepPurple,
            ),
            title: Text(adventurer.name),
            subtitle: Text(
              '${adventurer.role} - ${adventurer.goldCost} Gold',
            ),
            trailing: ElevatedButton(
              onPressed: () {
                context.read<PartyModel>().addAdventurer(
                  adventurer,
                );

                debugPrint(
                  '${adventurer.name} recruited!',
                );
              },
              child: const Text('Recruit'),
            ),
          ),
        );
      },
    );
  }
}
