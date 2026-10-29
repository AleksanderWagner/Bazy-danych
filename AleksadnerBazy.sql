CREATE TABLE kategoria (
	id_kategorii INT auto_increment primary key,
    nazwa varchar(50)
);

desc kategoria;

CREATE TABLE produkt (
	id_produktu INT auto_increment primary key,
    nazwa varchar(100) not null,
    data_dodania date,
    id_kategorii INT,
    foreign key(id_kategorii)
		references kategoria(id_kategorii)
);

desc produkt;

insert into kategoria
values(1, 'Komputery');

insert into kategoria
values
	(2, 'Akcesoria'),
    (3, 'Sprzet peryferyjny');
    
select * from kategoria;

update kategoria
set nazwa = 'Ogrod'
where id_kategorii = 3;

delete from kategoria where id_kategorii = 3;

insert into produkt (nazwa, data_dodania, id_kategorii)
values ('Mysz', '2026-10-29', 2);

select * from produkt;

alter table produkt
drop foreign key produkt_ibfk_1,
add foreign key(id_kategorii)
	references kategoria(id_kategorii)
    on delete set null;
    
delete from kategoria where id_kategorii = 2;

select * from produkt;

drop table kategoria, produkt;