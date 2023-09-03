DROP DATABASE soccerl_db;
CREATE DATABASE soccerl_db;
\c soccerl_db;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE leagues(
    id SERIAL PRIMARY KEY,
    league_name TEXT,
    start_date TEXT,
    end_date TEXT
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    referee_name TEXT
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams,
    team2 INTEGER REFERENCES teams,
    points_team1 INTEGER, 
    points_team2 INTEGER, 
    referee1 INTEGER REFERENCES referees,
    referee2 INTEGER REFERENCES referees
);

CREATE TABLE goals(
    game_id INTEGER REFERENCES games,
    team_id INTEGER REFERENCES teams,
    player_id INTEGER REFERENCES players
);


INSERT INTO teams 
(team_name)
VALUES
('Toronto FC'),
('Montreal FC'),
('Vancouver FC'), 
('Calgary FC');

INSERT INTO players
(player_name,team_id)
VALUES 
('Andrea L.',1 ),
('Paula K.', 1),
('Angela G.', 2),
('Caroline P.', 2),
('Kathy L.',3),
('Diana K.', 3),
('Heather M.', 4),
('Violeta P.', 4);

INSERT INTO leagues
(league_name, start_date, end_date)
VALUES
('Summer League', '2023-04-20', '2023-08-20'),
('Winter League', '2023-12-22', '2024-03-15');

INSERT INTO referees 
(referee_name)
VALUES
('Carlos Brown'),
('Adriana Thomson'),
('Scott Li');

INSERT INTO games 
(team1,team2, points_team1, points_team2, referee1,referee2)
VALUES
(1,2,3,0,1,2),
(3,4,1,1,2,3),
(1,4,3,0,2,3),
(2,3, 3,0,1,2);

INSERT INTO goals 
(game_id,team_id , player_id)
VALUES
(1,1,2),
(1,1,1),
(3,1,1),
(4,2,2);


