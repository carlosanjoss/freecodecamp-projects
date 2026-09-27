\connect postgres

DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;

\connect universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    number_of_stars INT NOT NULL,
    distance_from_earth NUMERIC(12, 2) NOT NULL,
    is_spherical BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    spectral_type VARCHAR(20) NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    mass_solar NUMERIC(8, 3) NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_type VARCHAR(50) NOT NULL,
    orbital_period_days NUMERIC(12, 2) NOT NULL,
    number_of_moons INT NOT NULL,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    diameter_km INT NOT NULL,
    orbital_period_days NUMERIC(10, 2) NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    description TEXT NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id)
);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    hemisphere VARCHAR(20) NOT NULL,
    brightest_star VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO galaxy
(name, galaxy_type, description, age_in_millions_of_years, number_of_stars, distance_from_earth, is_spherical)
VALUES
('Milky Way', 'Barred Spiral', 'Home galaxy of the Solar System.', 13600, 200000, 0.00, FALSE),
('Andromeda', 'Spiral', 'Nearest large galaxy to the Milky Way.', 10000, 1000000, 2537000.00, FALSE),
('Triangulum', 'Spiral', 'A smaller spiral galaxy in the Local Group.', 12000, 40000, 2730000.00, FALSE),
('Large Magellanic Cloud', 'Irregular', 'Satellite galaxy of the Milky Way.', 13000, 30000, 163000.00, FALSE),
('Small Magellanic Cloud', 'Irregular', 'Dwarf galaxy near the Milky Way.', 13000, 3000, 200000.00, FALSE),
('Messier 87', 'Elliptical', 'Giant elliptical galaxy in the Virgo Cluster.', 13000, 1000000, 53500000.00, TRUE);

INSERT INTO star
(name, spectral_type, age_in_millions_of_years, mass_solar, is_spherical, galaxy_id)
VALUES
('Sun', 'G2V', 4600, 1.000, TRUE, 1),
('Sirius', 'A1V', 242, 2.063, TRUE, 1),
('Proxima Centauri', 'M5.5Ve', 4850, 0.122, TRUE, 1),
('Alpheratz', 'B8IVpMnHg', 60, 3.600, TRUE, 2),
('Beta Trianguli', 'A5III', 730, 3.500, TRUE, 3),
('R136a1', 'WN5h', 2, 200.000, TRUE, 4);

INSERT INTO planet
(name, planet_type, orbital_period_days, number_of_moons, has_life, is_spherical, star_id)
VALUES
('Mercury', 'Terrestrial', 87.97, 0, FALSE, TRUE, 1),
('Venus', 'Terrestrial', 224.70, 0, FALSE, TRUE, 1),
('Earth', 'Terrestrial', 365.26, 1, TRUE, TRUE, 1),
('Mars', 'Terrestrial', 686.98, 2, FALSE, TRUE, 1),
('Jupiter', 'Gas Giant', 4332.59, 95, FALSE, TRUE, 1),
('Saturn', 'Gas Giant', 10759.22, 146, FALSE, TRUE, 1),
('Sirius b I', 'Hypothetical Terrestrial', 120.50, 1, FALSE, TRUE, 2),
('Sirius b II', 'Hypothetical Gas Giant', 430.75, 3, FALSE, TRUE, 2),
('Proxima Centauri b', 'Super-Earth', 11.19, 0, FALSE, TRUE, 3),
('Proxima Centauri d', 'Terrestrial', 5.12, 0, FALSE, TRUE, 3),
('Alpheratz I', 'Hypothetical Gas Giant', 510.00, 2, FALSE, TRUE, 4),
('Beta Trianguli I', 'Hypothetical Ice Giant', 760.00, 1, FALSE, TRUE, 5);

INSERT INTO moon
(name, diameter_km, orbital_period_days, is_spherical, description, planet_id)
VALUES
('Luna', 3474, 27.32, TRUE, 'Natural satellite of Earth.', 3),
('Phobos', 22, 0.32, FALSE, 'Inner moon of Mars.', 4),
('Deimos', 12, 1.26, FALSE, 'Outer moon of Mars.', 4),
('Io', 3643, 1.77, TRUE, 'Volcanically active moon of Jupiter.', 5),
('Europa', 3122, 3.55, TRUE, 'Icy moon of Jupiter with a subsurface ocean.', 5),
('Ganymede', 5268, 7.15, TRUE, 'Largest moon in the Solar System.', 5),
('Callisto', 4821, 16.69, TRUE, 'Heavily cratered moon of Jupiter.', 5),
('Amalthea', 167, 0.50, FALSE, 'Small inner moon of Jupiter.', 5),
('Titan', 5150, 15.95, TRUE, 'Largest moon of Saturn with a dense atmosphere.', 6),
('Rhea', 1528, 4.52, TRUE, 'Icy moon of Saturn.', 6),
('Iapetus', 1469, 79.32, TRUE, 'Two-toned moon of Saturn.', 6),
('Dione', 1123, 2.74, TRUE, 'Icy moon of Saturn.', 6),
('Tethys', 1062, 1.89, TRUE, 'Moon of Saturn with a large impact crater.', 6),
('Enceladus', 504, 1.37, TRUE, 'Icy moon with active water plumes.', 6),
('Mimas', 396, 0.94, TRUE, 'Small icy moon of Saturn.', 6),
('Hyperion', 270, 21.28, FALSE, 'Irregularly shaped moon of Saturn.', 6),
('Phoebe', 213, 550.48, FALSE, 'Retrograde irregular moon of Saturn.', 6),
('Sirius Moon Alpha', 1200, 18.25, TRUE, 'Hypothetical moon in the Sirius system.', 7),
('Alpheratz Moon Alpha', 950, 9.50, TRUE, 'Hypothetical moon orbiting Alpheratz I.', 11),
('Beta Trianguli Moon Alpha', 780, 14.10, TRUE, 'Hypothetical moon orbiting Beta Trianguli I.', 12);

INSERT INTO constellation
(name, hemisphere, brightest_star, description)
VALUES
('Orion', 'Celestial Equator', 'Rigel', 'Prominent constellation visible from much of Earth.'),
('Ursa Major', 'Northern', 'Alioth', 'Northern constellation containing the Big Dipper asterism.'),
('Crux', 'Southern', 'Acrux', 'Small southern constellation also known as the Southern Cross.');
