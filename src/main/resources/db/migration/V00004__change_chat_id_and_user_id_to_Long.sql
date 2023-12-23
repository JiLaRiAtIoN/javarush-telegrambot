-- 1. Remove the external button to avoid error.
ALTER TABLE group_x_user DROP CONSTRAINT group_x_user_user_id_fkey;

-- 2. Changing user_id type from varchar to int
alter table group_x_user alter column user_id type int using user_id::int;

-- 3. Changing chat_id from varchar to int
ALTER TABLE tg_user ALTER COLUMN chat_id TYPE integer USING chat_id::integer;

-- 4. Returning a foreign key
ALTER TABLE group_x_user ADD CONSTRAINT group_x_user_user_id_fkey
    FOREIGN KEY (user_id) REFERENCES tg_user(chat_id);