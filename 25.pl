% Facts
is_at(monkey, door).
is_at(box, window).
is_at(banana, middle).
hungry(monkey).

% Rules
grasp(Monkey, Banana) :- 
    hungry(Monkey), 
    climb(Monkey, box), 
    is_at(Banana, middle).

climb(Monkey, Box) :- 
    is_at(Monkey, Box), 
    is_at(Box, middle).

push(Monkey, Box, Position) :- 
    is_at(Box, Position), 
    is_at(Monkey, Position).

walk_to(Monkey, Position) :- 
    is_at(Monkey, CurrentPosition), 
    CurrentPosition \= Position.

move(Monkey, Action, NewState) :- 
    (Action = walk, walk_to(Monkey, NewPosition), 
    retract(is_at(Monkey, CurrentPosition)), 
    assert(is_at(Monkey, NewPosition));
    Action = push, push(Monkey, Box, NewPosition), 
    retract(is_at(Box, CurrentPosition)), 
    assert(is_at(Box, NewPosition));
    Action = climb, climb(Monkey, Box), 
    assert(is_at(Monkey, box))).

% Goal predicate to determine if the monkey can get the banana
canget(State) :- 
    write('move(a,b)').
    write('pushbox(b,b)').
    write('climb_box').
    write('grab_banana').
    move(monkey, Action, State),
    (State = state(_, _, middle, has) ; canget(State)).