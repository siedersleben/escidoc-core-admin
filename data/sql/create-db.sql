CREATE ROLE fedoraAdmin LOGIN PASSWORD 'fedoraAdmin' NOINHERIT CREATEDB VALID UNTIL 'infinity';
CREATE DATABASE escidoc-core  WITH ENCODING='UTF8' OWNER=postgres;
CREATE DATABASE fedora30 WITH ENCODING='UTF8' OWNER=fedoraAdmin;
CREATE DATABASE riTriples WITH ENCODING='SQL_ASCII' OWNER=fedoraAdmin;

