-- This script creates a new PostgreSQL user and a database with the same name as the user.
-- The user is granted full permissions on the created database.

-- Replace 'new_username' with the desired username.
DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT
        FROM   pg_catalog.pg_user
        WHERE  usename = 'new_username') THEN

        -- Create a new user
        CREATE USER new_username WITH PASSWORD 'password';

        -- Create a new database with the same name as the user
        CREATE DATABASE new_username OWNER new_username;

        -- Grant all privileges on the new database to the new user
        GRANT ALL PRIVILEGES ON DATABASE new_username TO new_username;
    END IF;
END
$$;
