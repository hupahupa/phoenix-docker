
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TYPE USER_GENDER_ENUM AS ENUM ('male', 'female', 'other');
CREATE TYPE LOGIN_SOURCE_ENUM AS ENUM ('facebook', 'google', 'email');
CREATE TABLE tbl_user(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE,
    password TEXT,
    email TEXT UNIQUE,
    first_name TEXT,
    last_name TEXT,
    full_name TEXT,
    phone TEXT,
    secret_toke TEXT UNIQUE,
    created_at TIMESTAMP WITHOUT TIME ZONE  DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE  DEFAULT NOW()
);

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE tbl_user;
DROP TYPE USER_GENDER_ENUM;
DROP TYPE LOGIN_SOURCE_ENUM;
