create database game_community;

create table player(playerid integer,
				   password char(32),
				   join_date datetime,
				   score decimal(2,1) check (score<=10 and score>=0),
				   primary key (playerid)
);

create table game(gameid integer,
			     price decimal(10,2),
				 title varchar(255),
				 developer varchar(255),
				 release_date date,
			     score decimal(2,1) check (score<=10 and score>=0),
				 genre varchar(30),
				 primary key (gameid)
);

create table reviews(reviewid integer,
					 review text,
					 review_time datetime,
					 rating integer,
					 primary key(reviewid)
);

create table review_game(reviewid integer,
						 playerid integer,
						 gameid integer,
						 primary key (reviewid),
						 foreign key (reviewid) references reviews(reviewid),
						 foreign key (playerid) references player(playerid),
						 foreign key (gameid) references game(gameid)
);

create table rate_review(reviewid integer,
						 playerid integer,
						 rating smallint check (rating=-1 or rating=1),
						 primary key (reviewid, playerid),
						 foreign key (reviewid) references reviews(reviewid),
						 foreign key (playerid) references player(playerid)
);

create table plays(playerid integer,
				   gameid integer,
				   play_status varchar(13) check (play_status='has played' or play_status='is playing' or play_status='wants to play'),
				   primary key (playerid, gameid),
				   foreign key (playerid) references player(playerid),
				   foreign key (gameid) references game(gameid)
);

create table challenges(challengerid integer,
						accepterid integer,
						gameid integer,
						challengeid integer,
						cha_time datetime,
						outcome varchar(4) check (outcome='Win' or outcome='Lose' or outcome = 'Draw'),
						primary key (challengeid),
						foreign key (challengerid) references player(playerid),
						foreign key (accepterid) references player(playerid),
						foreign key (gameid) references game(gameid)
);

create table comments(commenterid integer,
				      receiverid integer,
					  comment_content text,
					  comment_time datetime,
					  primary key (commenterid, receiverid),
					  foreign key (commenterid) references player(playerid),
					  foreign key (receiverid) references player(playerid)
);

create table rate_game(playerid integer,
					   gamescore integer check (gamescore<=10 and gamescore>=0),
					   gameid integer,
					   foreign key (playerid) references player(playerid),
					   foreign key (gameid) references game(gameid),
					   primary key (gameid, playerid)
);



