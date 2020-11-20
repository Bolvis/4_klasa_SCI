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

INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS12345', 200000, 'Polska', 22000, 68000);
INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS13377', 146134, 'Francja', 19000, 69000);
INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS23456', 150000, 'Niemcy', 32000, 88000);
INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS234RP', 158000, 'Holandia', 16000, 141000);
INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS34567', 220000, 'Polska', 45000, 105000);
INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS54321', 155000, 'Niemcy', 24000, 84000);
INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS567WZ', 180000, 'Polska', 28000, 79000);
INSERT INTO sbd10.inne (nr_rej, przebieg, kraj, cenat, wartoscpocz) VALUES ('ZS76543', 255000, 'Polska', 18000, 49000);