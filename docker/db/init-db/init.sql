-- Create database
CREATE DATABASE myappdb;

-- Create user
CREATE USER myappuser WITH ENCRYPTED PASSWORD 'myapppassword';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE myappdb TO myappuser;

-- Connect to the database
\c myappdb;

-- Create login table
CREATE TABLE login_user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
