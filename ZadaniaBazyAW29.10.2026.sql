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

alter table zadanie 
modify column priorytet enum('normalny', 'wysoki', 'niski') default 'normalny';

insert into zadanie (nazwa_zadania, priorytet, opis, id_pracownika) values
('Przygotowanie raportu', 'wysoki', 'Raport miesięczny ze sprzedaży', 1),
('Aktualizacja bazy danych', default, 'Weryfikacja danych klientów', 2),
('Inwentaryzacja sprzętu', 'niski', null, 3);

create table projekt (
    id_projektu int auto_increment primary key,
    nazwa_projektu varchar(150),
    data_rozpoczecia date,
    data_zakonczenia date null
);

alter table projekt
add column menadzer_projektu int,
add constraint fk_projekt_menadzer
foreign key (menadzer_projektu) references pracownik(id_pracownika);
    
insert into projekt (nazwa_projektu, data_rozpoczecia, data_zakonczenia, menadzer_projektu) values
('Wdrożenie nowego systemu', '2026-01-15', '2026-06-30', 1),
('Modernizacja strony internetowej', '2026-03-01', null, 2);
    
alter table zadanie
add column projekt int,
add constraint fk_zadanie_projekt
foreign key (projekt) references projekt(id_projektu)
on delete cascade;

create table sprint (
	id_sprint int auto_increment primary key,
    numer_sprintu int unsigned not null,
    data_rozpoczecia date,
    data_zakonczenia date
);


