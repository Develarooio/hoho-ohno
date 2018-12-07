# Hoho-Ohno

A christmas-y game requiring the player to manage his/her own sanity in order to deal with wandering ghosts


# Mechanic Summary

## Game Objects

* Player
* Ghosties
* Pills
* Map

## Behaviors

* There is one level which
    * contains a Player
    * Ghosties spawn in
    * contains Pills
    * shakes with an amplitude that scales with the Player's insanity
* There is a Player which
    * can direct movement using the keyboard
    * can dash with a single button push
    * can shoot a weapon
    * can aim their weapon using the mouse
    * takes damage when they collide with a Ghosty
    * can kill a Ghosty by shooting it
    * has a level of insanity which
        * is increased by consuming Pills
        * is decreased by the passing of time
* There is a fog of war (FoW) viewport which
    * decreases in size as the Player becomes more insane
* There is a score which
    * The Player can increase by killing Ghosties
* There are Pills which
    * the player can consume by collision
    * spawn at a constant rate
    * spawn in random locations
* There are Ghosties which
    * have a transparency which scales with the Player's insanity
    * wander randomly (?) around the map
    * wander at a speed which scales with elapsed play time
    * come in different flavors a la Pac-man which
        * vary in speed
    * chase the player
    * spawn at a frequency which scales with elapsed play time

## Goals

1. Earn as many points as possible

## Tensions

* High level of insanity vs low level of insanity

