-- Note: All data was imported using the Import/Export Wizard 
-- Note: Data must be imported in the same order in which the schemas are created

-- Create School Table
create table school_id_table (
	college varchar not null,
	School_ID varchar(5) not null,
	primary key (School_ID)
);

-- Import Data and View
select * from school_id_table;

-- Create Team Table
create table team_table (
	Franchise varchar not null,
	Lg varchar not null,
	Team_Start int not null,
	Team_End int not null,
	Yrs int not null,
	G int not null,
	W int not null,
	L int not null,
	W_L_PCT float not null,
	Plyfs int not null,
	Div int not null,
	Conf int not null,
	Champ int not null,
	Abbreviation varchar(3) not null,
	primary key (Abbreviation)
);

-- Import Data and View
select * from team_table;

-- Create Players Table
create table players_table (
	active_from int not null,
	active_to int not null,
	birth_date date,
	height int,
	name varchar not null,
	position varchar,
	player_id varchar not null,
	primary key (player_id),
	weight float,
	NBA_Years_Active int not null,
	School varchar not null,
	School_ID varchar(5) not null,
	foreign key (School_ID) references school_id_table(School_ID)
);

-- Import Data and View
select * from players_table;

-- Create NBA Awards Table
create table nba_awards(
	Season varchar not null,
	Lg varchar not null,
	Champion varchar not null,
	MVP varchar not null,
	ROY varchar not null,
	PTS varchar not null,
	TRB varchar not null,
	AST varchar not null,
	WS varchar not null,
	mvp_player_id varchar not null,
	foreign key (mvp_player_id) references players_table(player_id),
	roy_player_id varchar not null,
	foreign key (roy_player_id) references players_table(player_id),
	pts_player_id varchar not null,
	foreign key (pts_player_id) references players_table(player_id),
	trb_player_id varchar not null,
	foreign key (trb_player_id) references players_table(player_id),
	ast_player_id varchar not null,
	foreign key (ast_player_id) references players_table(player_id),
	ws_player_id varchar not null,
	foreign key (ws_player_id) references players_table(player_id),
	TeamID varchar not null,
	foreign key (TeamID) references team_table(Abbreviation)
);

-- Import Data and View
select * from nba_awards;

-- Create NBA Draft Table
create table draft_table(
	Year int not null,
	Lg varchar not null,
	Team varchar not null,
	name varchar not null,
	School varchar not null,
	School_ID varchar(5) not null,
	foreign key (School_ID) references school_id_table(School_ID),
	Player_ID varchar not null,
	foreign key (Player_ID) references players_table(player_id)
);

-- Import Data and View
select * from draft_table;

-- Create Season Stats Table
create table nba_season_stats(
	Year int not null,
	Player varchar not null,
	Pos varchar,
	Age float,
	Tm varchar not null,
	foreign key (Tm) references team_table(Abbreviation),
	G float not null,
	GS float,
	MP float,
	PER float,
	TS_PCT float,
	"3PAr" float,
	FTr float,
	ORB_PCT float,
	DRB_PCT float,
	TRB_PCT float,
	AST_PCT float,
	STL_PCT float,
	BLK_PCT float,
	TOV_PCT float,
	USG_PCT float,
	OWS float,
	DWS float,
	WS float,
	WS_PCT48 float,
	OBPM float,
	DBPM float,
	BPM float,
	VORP float,
	FG float,
	FGA float,
	FG_PCT float,
	"3P" float,
	"3PA" float,
	"3P_PCT" float,
	"2P" float,
	"2PA" float,
	"2P_PCT" float,
	eFG_PCT float,
	FT float,
	FTA float,
	FT_PCT float,
	ORB float,
	DRB float,
	TRB float,
	AST float,
	STL float,
	BLK float,
	TOV float,
	PF float,
	PTS float,
	player_id varchar not null,
	foreign key (player_id) references players_table(player_id)
);

-- Import Data and View
select * from nba_season_stats;


