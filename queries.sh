#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

# 1
echo "Total number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"
echo ""

# 2
echo "Total number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"
echo ""

# 3
echo "Average number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"
echo ""

# 4
echo "Average number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"
echo ""

# 5
echo "Average number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"
echo ""

# 6
echo "Most goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games")"
echo ""

# 7
echo "Number of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"
echo ""

# 8
echo "Winner of the 2018 tournament team name:"
echo "$($PSQL "SELECT t.name FROM games g JOIN teams t ON g.winner_id = t.team_id WHERE g.round='Final' AND g.year=2018")"
echo ""

# 9
echo "List of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT t.name FROM games g JOIN teams t ON (g.winner_id = t.team_id OR g.opponent_id = t.team_id) WHERE g.year=2014 AND g.round='Eighth-Final' ORDER BY t.name")"
echo ""

# 10
echo "List of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT t.name FROM games g JOIN teams t ON g.winner_id = t.team_id ORDER BY t.name")"
echo ""

# 11
echo "Year and team name of all the champions:"
echo "$($PSQL "SELECT g.year || '|' || t.name FROM games g JOIN teams t ON g.winner_id = t.team_id WHERE g.round='Final' ORDER BY g.year")"
echo ""

# 12
echo "List of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%' ORDER BY name")"
