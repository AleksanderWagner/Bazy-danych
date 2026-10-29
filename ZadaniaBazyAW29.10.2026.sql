create table pracownik (
	id_pracownika INT auto_increment primary key,
    imie varchar(40) not null,
    nazwisko varchar(60) not null,
    data_urodzenia date not null
);
insert into pracownik
values
(1, 'Myszard', 'Tuminski', '1960.12.31'),
(2, 'Gertruda', 'Nieszczera', '1960.12.31'),
(3, 'Kamil', 'Slimak', '1960.12.31');

update pracownik
set data_urodzenia = '1959.12.31'
where id_pracownika = 1;

select * from pracownik;

create table zadanie (
	id_zadania int auto_increment primary key,
    nazwa_zadania varchar(150) not null,
    priorytet enum('normalny', 'wysoki', 'niski'),
    opis longtext,
    id_pracownika int,
    foreign key (id_pracownika)
		references pracownik(id_pracownika)
        on delete set null
);