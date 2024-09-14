% Facts: Define foods, their caloric content per serving (in kcal), and their suitability for certain diseases
food(apple, 52, diabetes).
food(apple, 52, hypertension).
food(banana, 89, hypertension).
food(orange, 43, diabetes).
food(chicken_breast, 165, diabetes).
food(chicken_breast, 165, heart_disease).
food(egg, 78, heart_disease).
food(broccoli, 55, diabetes).
food(broccoli, 55, hypertension).
food(salmon, 208, heart_disease).
food(rice, 130, none).
food(bread, 66, none).
food(milk, 42, diabetes).
food(oats, 68, heart_disease).
food(spinach, 23, hypertension).
food(almonds, 7, diabetes).
food(almonds, 7, heart_disease).

% Define disease goals and caloric limits
goal(diabetes, 1800).
goal(heart_disease, 2000).
goal(hypertension, 1700).

% Suggest foods based on the disease
suggest_food(Disease, Food) :-
    food(Food, Calories, Disease),
    goal(Disease, MaxCalories),
    Calories =< MaxCalories.

% Determine daily meal plan based on the disease
meal_plan(Disease, [Food1, Food2, Food3], TotalCalories) :-
    suggest_food(Disease, Food1),
    suggest_food(Disease, Food2),
    suggest_food(Disease, Food3),
    food(Food1, Calories1, _),
    food(Food2, Calories2, _),
    food(Food3, Calories3, _),
    TotalCalories is Calories1 + Calories2 + Calories3,
    goal(Disease, MaxCalories),
    TotalCalories =< MaxCalories.

% Print output
print_meal_plan(Disease) :-
    meal_plan(Disease, [Food1, Food2, Food3], TotalCalories),
    format('Meal Plan for ~w:~n', [Disease]),
    format('1. ~w~n', [Food1]),
    format('2. ~w~n', [Food2]),
    format('3. ~w~n', [Food3]),
    format('Total Calories: ~w kcal~n', [TotalCalories]).
