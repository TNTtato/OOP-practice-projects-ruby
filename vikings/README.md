# Vikings

This is a program that produces vikings objects given a `Viking` class.

For this porpuse I used some class methods to create a random viking warrior.
This methods are `::create_warrior` that takes an argument `name` and the `::random_name` that samples a name from a given list of names.
We can still create a custom warrior by passing the arguments thar we want to the constructor.

## Vikings methods

This methods represent actions that can be performed by the warriors:

- `#attack` inflicts damage to another warrior, for this `protected` `#take_damage` method and `private #die` method are used