DROP SEQUENCE IF EXISTS "public"."pokemons_id_pokemon_seq";
DROP SEQUENCE IF EXISTS "public"."movesets_id_moveset_seq";
DROP SEQUENCE IF EXISTS "public"."usuarios_id_usuario_seq";
DROP TABLE IF EXISTS "public"."pokemons";
DROP TABLE IF EXISTS "public"."movesets";
DROP TABLE IF EXISTS "public"."usuarios";
CREATE SEQUENCE "pokemons_id_pokemon_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE SEQUENCE "movesets_id_moveset_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE SEQUENCE "usuarios_id_usuario_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE TABLE "pokemons" (
  "id_pokemon" int4 NOT NULL DEFAULT nextval('pokemons_id_pokemon_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "stats" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "pokemons" OWNER TO "postgres";
CREATE TABLE "movesets" (
  "id_moveset" int4 NOT NULL DEFAULT nextval('movesets_id_moveset_seq'::regclass),
  "id_user" int4,
  "id_pokemon" int4,
  "moveset" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "movesets" OWNER TO "postgres";
CREATE TABLE "usuarios" (
  "id_usuario" int4 NOT NULL DEFAULT nextval('usuarios_id_usuario_seq'::regclass),
  "usuario" varchar(255) COLLATE "pg_catalog"."default",
  "clave" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "usuarios" OWNER TO "postgres";
BEGIN;
LOCK TABLE "public"."pokemons" IN SHARE MODE;
DELETE FROM "public"."pokemons";
INSERT INTO "public"."pokemons" ("id_pokemon","name","type","stats") VALUES (1, 'Snorlax', 'Normal', '160, 110, 65, 65, 110, 30'),(2, "Blastoise",	"Water",	"79, 83, 100, 85, 105, 78"),(3,	"Charizard",	"Fire/Flying",	"78, 84, 78, 109, 85, 100"),(4,	"Pikachu",	"Electric",	"35, 55, 30, 50, 40, 90"),(5,	"Venusaur", "Grass/Poison",	"80, 82, 83, 100, 100, 80");
COMMIT;
BEGIN;
LOCK TABLE "public"."movesets" IN SHARE MODE;
DELETE FROM "public"."movesets";
INSERT INTO "public"."movesets" ("id_moveset","id_user","id_pokemon","moveset") VALUES (1, 1, 1, 'fdsa');
COMMIT;
BEGIN;
LOCK TABLE "public"."usuarios" IN SHARE MODE;
DELETE FROM "public"."usuarios";
INSERT INTO "public"."usuarios" ("id_usuario","usuario","clave") VALUES (1, 'andru', 'andru');
COMMIT;
ALTER TABLE "pokemons" ADD CONSTRAINT "pokemons_pkey" PRIMARY KEY ("id_pokemon");
ALTER TABLE "movesets" ADD CONSTRAINT "movesets_pkey" PRIMARY KEY ("id_moveset");
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id_usuario");
ALTER TABLE "movesets" ADD CONSTRAINT "fk_commit_pokemon" FOREIGN KEY ("id_pokemon") REFERENCES "public"."pokemons" ("id_pokemon") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "movesets" ADD CONSTRAINT "fk_commit_user" FOREIGN KEY ("id_user") REFERENCES "public"."usuarios" ("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER SEQUENCE "pokemons_id_pokemon_seq"
OWNED BY "pokemons"."id_pokemon";
SELECT setval('"pokemons_id_pokemon_seq"', 2, false);
ALTER SEQUENCE "pokemons_id_pokemon_seq" OWNER TO "postgres";
ALTER SEQUENCE "movesets_id_moveset_seq"
OWNED BY "movesets"."id_moveset";
SELECT setval('"movesets_id_moveset_seq"', 12, true);
ALTER SEQUENCE "movesets_id_moveset_seq" OWNER TO "postgres";
ALTER SEQUENCE "usuarios_id_usuario_seq"
OWNED BY "usuarios"."id_usuario";
SELECT setval('"usuarios_id_usuario_seq"', 2, true);
ALTER SEQUENCE "usuarios_id_usuario_seq" OWNER TO "postgres";