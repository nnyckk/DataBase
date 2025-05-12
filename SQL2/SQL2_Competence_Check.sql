
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

create table departments (
    department_id number(4) constraint department_primary_key primary key,
    department_name varchar(30),
    manager_id number(6),
    location_id number(4),
    Foreign Key (location_id) References locations(location_id)
);


create table jobs (
    job_id varchar(20) constraint job_primary_key primary key,
    job_title varchar(35),
    min_salary number(6),
    max_salary number(6)
);


create table employees (
    employee_id number(6) constraint employee_primary_key primary key,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(25),
    phone_number varchar(20),
    hire_date date,
    job_id varchar(10),
    salary decimal(8,2),
    commission_pct decimal(2,2),
    manager_id number(6),
    department_id number(4),
    Foreign Key (job_id) References jobs(job_id),
    Foreign Key (manager_id) References employees(employee_id),
    Foreign Key (department_id) References departments(department_id)
);


create table job_history (
    employee_id number(6),
    start_date date constraint job_history_primary_key primary key,
    end_date date,
    job_id varchar(10),
    department_id number(10),
    Foreign Key (employee_id) References employees(employee_id),
    Foreign Key (job_id) References jobs(job_id),
    Foreign Key (department_id) References departments(department_id)
)


