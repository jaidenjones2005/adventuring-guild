
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'party_model.dart';

class QuestPartySummary extends StatelessWidget {
  const QuestPartySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PartyModel>(
      builder: (context, partyModel, child) {
        return Card(
          margin: const EdgeInsets.all(12),
          color: Colors.deepPurple.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quest Party Summary',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  'Party Count: ${partyModel.partyCount}',
                  style: const TextStyle(fontSize: 18),
                ),

                Text(
                  'Total Gold Cost: ${partyModel.totalCost} Gold',
                  style: const TextStyle(fontSize: 18),
                ),

                const Divider(),

                const Text(
                  'Active Party Members:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                if (partyModel.party.isEmpty)
                  const Text('No adventurers recruited yet.'),

                if (partyModel.party.isNotEmpty)
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: partyModel.partyCount,
                      itemBuilder: (context, index) {
                        final adventurer = partyModel.party[index];

                        return ListTile(
                          title: Text(adventurer.name),
                          subtitle: Text(
                            '${adventurer.goldCost} Gold',
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              context
                                  .read<PartyModel>()
                                  .removeAdventurer(adventurer);
                            },
                            child: const Text('Dismiss'),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
