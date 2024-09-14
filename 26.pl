% Facts: fruit and its color
fruit(apple, red).
fruit(banana, yellow).
fruit(orange, orange).
fruit(grape, purple).
fruit(kiwi, green).
fruit(lemon, yellow).
fruit(strawberry, red).

% Rule to find color of a fruit
fruit_color(Fruit, Color) :-
    fruit(Fruit, Color).

% Rule to find fruits by color
fruits_by_color(Color, Fruit) :-
    fruit(Fruit, Color).
