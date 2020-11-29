create table dane
(
    nr_rej  varchar(7) not null
        primary key,
    marka   text       null,
    model   text       null,
    rocznik int        null
);

INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS12345', 'Opel', 'Astra', 2009);
INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS13377', 'Kia', 'Carnival', 2011);
INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS23456', 'BMW', '5', 2011);
INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS234RP', 'Opel', 'Corsa', 2017);
INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS34567', 'Mercedes', 'C200', 2007);
INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS54321', 'Toyota', 'Auris', 2016);
INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS567WZ', 'Honda', 'Accord', 2012);
INSERT INTO sbd10.dane (nr_rej, marka, model, rocznik) VALUES ('ZS76543', 'Nissan', 'Note', 2015);