create table actors
(
    id   int auto_increment
        primary key,
    name varchar(255) null
);

create table movies
(
    id    int auto_increment
        primary key,
    title varchar(255) not null,
    year  year         null
);

create table directors
(
    id       int auto_increment
        primary key,
    name     varchar(255) null,
    movie_id int          null,
    constraint directors_ibfk_1
        foreign key (movie_id) references movies (id)
);

create index movie_id
    on directors (movie_id);

create index movies_ids
    on movies (id);

create index movies_ids_titles
    on movies (id, title);

create table movies_actors
(
    id       int auto_increment
        primary key,
    movie_id int not null,
    actor_ID int not null,
    constraint movies_actors_ibfk_1
        foreign key (movie_id) references movies (id),
    constraint movies_actors_ibfk_2
        foreign key (actor_ID) references actors (id)
);

create index actor_ID
    on movies_actors (actor_ID);

create index movie_id
    on movies_actors (movie_id);

create table production_teams
(
    id        int auto_increment
        primary key,
    team_name varchar(255) null
);

create table movies_production_teams
(
    id                 int auto_increment
        primary key,
    movie_id           int null,
    production_team_id int null,
    constraint movies_production_teams_ibfk_1
        foreign key (movie_id) references movies (id)
            on delete cascade,
    constraint movies_production_teams_ibfk_2
        foreign key (production_team_id) references production_teams (id)
            on delete cascade
);

create index movie_id
    on movies_production_teams (movie_id);

create index production_team_id
    on movies_production_teams (production_team_id);


