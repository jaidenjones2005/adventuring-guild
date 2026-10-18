
# Adventuring Guild Party Builder Journal

## Phase 1: Adventurer & Party Model

In this phase, I created the Adventurer class to
represent heroes with a name, role, and gold cost.

I also created PartyModel using ChangeNotifier to
manage the list of recruited adventurers.

The model includes methods for adding and removing
heroes, counting party members, and calculating
the total gold cost.

The notifyListeners() method tells listening widgets
when the party changes so they can update automatically.

Without notifyListeners(), the underlying data would
change, but listening widgets would not be notified
to rebuild and display the updated information.


## Phase 2: The Guild Provider

In this phase, I installed the Provider package and
connected PartyModel to the application using
ChangeNotifierProvider.

I wrapped MyApp with ChangeNotifierProvider so
all widgets below it can access the same party data.

Placing the provider high in the widget tree is
important because multiple screens and widgets
need access to the shared state.

If the provider were placed inside a single list
item, other parts of the application would not
be able to access that same PartyModel instance.

This phase helped me understand how Provider
makes it easier to share state across an app.


## Phase 3: The Guild Hall Roster

In this phase, I created the GuildHallRoster widget
to display five available adventurers.

Each adventurer has a name, role, gold cost, and
Recruit button.

I used ListView.builder to display the adventurers
and context.read<PartyModel>() to add selected
heroes to the shared party.

The difference between context.read and context.watch
is that read accesses the model without subscribing
the widget to changes, while watch listens for changes
and rebuilds the widget.

I used context.read inside the Recruit button because
the button only needs to perform an action, not
rebuild whenever the party changes.


## Phase 4: The Quest Party Summary

In this phase, I created the QuestPartySummary widget
to display the number of recruited adventurers,
their total gold cost, and the active party roster.

I used Consumer<PartyModel> to automatically rebuild
the summary whenever the party changes.

When the Recruit button is clicked, context.read
accesses PartyModel and calls addAdventurer().

PartyModel updates the private list and calls
notifyListeners(), which alerts Consumer<PartyModel>
that the shared state has changed.

The summary then rebuilds and displays the updated
party count, total gold cost, and active members.

I also added Dismiss buttons that remove adventurers
and automatically update the summary.


## Phase 5: Validation & Reflection

In this phase, I tested the Adventuring Guild Party
Builder to verify that shared state updates correctly.

I tested recruiting adventurers, dismissing party
members, and checking the total party count and
gold cost.

I also checked how the application handles an
empty party and duplicate recruitment.

The application uses ChangeNotifier and Provider
to automatically update the Quest Party Summary
whenever the party changes.

One important thing I learned was that duplicate
adventurers can be recruited because the current
model allows the same adventurer to be added
multiple times.

I also learned that notifyListeners() is essential
because it tells Consumer widgets to rebuild
after the shared data changes.

Overall, this assignment helped me understand
the difference between local widget state and
shared application state in Flutter.
