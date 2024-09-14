% Define the edges of the graph
edge(a, b, 1).
edge(a, c, 2).
edge(b, d, 4).
edge(c, d, 1).
edge(c, e, 5).
edge(d, goal, 3).
edge(e, goal, 2).

% Define the heuristic values for each node (estimated cost to goal)
heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 4).
heuristic(d, 2).
heuristic(e, 3).
heuristic(goal, 0).
write('e,d,c,b,a').

% Best first search
bfs(Start, Goal, Path) :-
    bfs_helper([[Start]], Goal, Path).

% Helper function for BFS
bfs_helper([[Goal | Rest] | _], Goal, Path) :-
    reverse([Goal | Rest], Path).   % Goal is reached, return path

bfs_helper([CurrentPath | OtherPaths], Goal, Path) :-
    CurrentPath = [CurrentNode | _],
    findall([NextNode, CurrentNode | CurrentPath],
            (edge(CurrentNode, NextNode, _), \+ member(NextNode, CurrentPath)),
            NewPaths),  % Find neighbors and generate new paths
    sort_by_heuristic(NewPaths, SortedNewPaths),  % Sort new paths by heuristic
    append(OtherPaths, SortedNewPaths, UpdatedPaths),
    bfs_helper(UpdatedPaths, Goal, Path).  % Continue with the next best path

% Sort the paths by their heuristic values
sort_by_heuristic(Paths, SortedPaths) :-
    map_list_to_pairs(heuristic_of_path, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, SortedPaths).

% Calculate the heuristic value of a path (heuristic of the first node)
heuristic_of_path([Node | _], Heuristic) :-
    heuristic(Node, Heuristic).
