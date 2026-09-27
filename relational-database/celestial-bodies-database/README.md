# Celestial Bodies Database

A PostgreSQL project from freeCodeCamp's **Relational Database** certification.

The project builds a `universe` database containing galaxies, stars, planets, moons, and constellations while satisfying the schema, relationship, data-type, uniqueness, nullability, and row-count requirements defined by the freeCodeCamp challenge.

## Files

- `universe.sql` — complete PostgreSQL dump/script that creates and populates the database.

## Database structure

The database contains five tables:

- `galaxy`
- `star`
- `planet`
- `moon`
- `constellation`

Relationships:

```text
galaxy 1 ── N star
star   1 ── N planet
planet 1 ── N moon
```

All primary keys use the `table_name_id` convention and auto-increment through PostgreSQL `SERIAL` columns. Foreign-key columns use the same names as the primary keys they reference.

## Rebuild the database

With PostgreSQL installed, run:

```bash
psql -U postgres < universe.sql
```

The script drops any existing `universe` database, recreates it, defines the schema, and inserts the required data.

## Challenge requirements covered

- PostgreSQL database named `universe`
- At least five tables
- Auto-incrementing primary keys
- `VARCHAR`, `INT`, `NUMERIC`, `TEXT`, and `BOOLEAN` data types
- `NOT NULL` and `UNIQUE` constraints
- Foreign-key relationships between galaxies, stars, planets, and moons
- At least 6 galaxies
- At least 6 stars
- At least 12 planets
- At least 20 moons
- At least 3 rows in every table
