Create TABLE users (
    id BIGINT generated ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    name varchar(255) NOT NULL,
    user_role varchar(50) NOT NULL Default 'player',
    created_at TimeSTAMPTZ not null default now(),
    Constraint chk_user_role CHECK (user_role IN ('player', 'organizer'))

);

create table games (
    id BIGINT generated ALWAYS AS IDENTITY PRIMARY KEY,
    organizer_id BIGINT NOT NULL,
    location VARCHAR(255) NOT NULL,
    start_at Timestamptz NOT NULL,
    max_capacity INT NOT NULL,
    created_at TimeSTAMPTZ not null default now(),
    Constraint chk_max_capacity CHECK (max_capacity > 0),
    constraint fk_organizer FOREIGN KEY (organizer_id) REFERENCES users(id) ON DELETE RESTRICT

);

create table rsvps (
    id BIGINT generated ALWAYS AS IDENTITY PRIMARY KEY,
    game_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    status varchar(50) NOT NULL,
    created_at TimeSTAMPTZ not null default now(),
    confirmed_at TimeSTAMPTZ,
    constraint fk_game FOREIGN KEY (game_id) REFERENCES games(id) ON Delete cascade,
    constraint fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON Delete cascade,
    constraint chk_status CHECK (status IN ('pending', 'confirmed', 'cancelled')),
    constraint unique_rsvp UNIQUE (game_id, user_id)
);