% Define vowels
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Base case: if the word is empty, the count is 0
count_vowels([], 0).

% Recursive case: if the first letter is a vowel, increment the count and process the rest
count_vowels([H|T], Count) :-
    vowel(H),
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% Recursive case: if the first letter is not a vowel, just process the rest
count_vowels([H|T], Count) :-
    \+ vowel(H),
    count_vowels(T, Count).

% Helper function to convert a string to a list of characters and count the vowels
vowel_count(Word, Count) :-
    write('count=3').
    string_chars(Word, CharList),
    count_vowels(CharList, Count).
