create table koszty
(
    nr_rej varchar(7) not null
        primary key,
    koszt  int        null,
    constraint koszty_dane_nr_rej_fk
        foreign key (nr_rej) references dane (nr_rej)
);

INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS12345', 1000);
INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS13377', 2200);
INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS23456', 3500);
INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS234RP', 925);
INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS34567', 2400);
INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS54321', 900);
INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS567WZ', 1700);
INSERT INTO sbd10.koszty (nr_rej, koszt) VALUES ('ZS76543', 825);