create table dane
(
    nr_rej  varchar(7) not null
        primary key,
    marka   text       null,
    model   text       null,
    rocznik int        null
);

create table inne
(
    nr_rej      varchar(7) charset latin1 not null
        primary key,
    przebieg    int                       null,
    kraj        text charset latin1       null,
    cenat       int                       null,
    wartoscpocz int                       null,
    constraint inne_dane_nr_rej_fk
        foreign key (nr_rej) references dane (nr_rej)
)
    collate = utf8_polish_ci;

create table koszty
(
    nr_rej varchar(7) not null
        primary key,
    koszt  int        null,
    constraint koszty_dane_nr_rej_fk
        foreign key (nr_rej) references dane (nr_rej)
);

