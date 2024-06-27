CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- export CONNECTION_URL="postgresql://postgres:password@localhost:5432/cruddur"
-- PROD_CONNECTION_URL="postgresql://cruddurroot:goodDBpass1@cruddur-db-instance.c18i0yk8q5nx.us-east-2.rds.amazonaws.com:5432/cruddur"


DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.activities;

CREATE TABLE public.users (
  uuid UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  display_name text,
  handle text,
  cognito_user_id text,
  created_at TIMESTAMP default current_timestamp NOT NULL
);

CREATE TABLE public.activities (
  uuid UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_uuid UUID NOT NULL,
  message text NOT NULL,
  replies_count integer DEFAULT 0,
  reposts_count integer DEFAULT 0,
  likes_count integer DEFAULT 0,
  reply_to_activity_uuid integer,
  expires_at TIMESTAMP,
  created_at TIMESTAMP default current_timestamp NOT NULL
);