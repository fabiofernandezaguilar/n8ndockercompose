CREATE USER n8n_user WITH PASSWORD 'sqls3rv3r'
CREATE DATABASE n8n_db OWNER n8n_user
-- (Opcional, pero recomendado) Conéctate a n8n_db y crea un schema dedicado si quieres
-- \c n8n_db
CREATE SCHEMA n8n_schema AUTHORIZATION n8n_user