
create table
    regions (
    region_id number(11) constraint region_primary_key primary key,
    region_name varchar(25)
);


create table countries (
    country_id char(2) constraint country_primary_key primary key,
    country_name varchar(40),
    region_id number(11),
    Foreign Key (region_id) References regions(region_id)
);


create table locations (
    location_id number(4) constraint location_primary_key primary key,
    street_address varchar(40),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(25),
    country_id char(2),
    Foreign Key (country_id) References countries(country_id)
);






