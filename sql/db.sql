drop table if exists article_images;
drop table if exists articles;
drop table if exists article_category;
drop table if exists manufacturers;

#####################################################################
create table manufacturers
(
    manufacturer_id int auto_increment,
    manufacturer_name varchar(255),
    manufacturer_description text,
    manufacturer_added datetime default current_timestamp(),
    manufacturer_updated datetime on update current_timestamp(),
    PRIMARY KEY (manufacturer_id)
);

create table article_category (
                                  category_id int auto_increment,
                                  category_name varchar(255) not null,
                                  category_added datetime default current_timestamp(),
                                  category_updated datetime on update current_timestamp(),
                                  primary key (category_id)
);

CREATE TABLE articles (
                          article_id int auto_increment,
                          category_id int not null,
                          manufacturer_id int not null,
                          article_heading varchar(255) not null,
                          article_subtitle varchar(510),
                          rating tinyint,
                          article_description text,
                          article_added datetime default current_timestamp(),
                          article_updated datetime on update current_timestamp(),
                          PRIMARY KEY (article_id),
                          foreign key (category_id) references article_category(category_id),
                          foreign key (manufacturer_id) references manufacturers(manufacturer_id)
);

create table article_images (
                                article_image_id int auto_increment,
                                article_id int not null,
                                size int,
                                file_name varchar(255),
                                image_added datetime default current_timestamp(),
                                image_updated datetime on update current_timestamp(),
                                PRIMARY KEY (article_image_id),
                                foreign key (article_id) references articles(article_id)
);

CREATE UNIQUE INDEX article_size
    ON article_images (article_id, size);


#####################################################################
insert into manufacturers (manufacturer_name, manufacturer_description) value ('AMD', 'Advanced Micro Devices (AMD) ist ein US-amerikanischer Chip-Entwickler mit Hauptsitz in Santa Clara, Kalifornien. AMD entwickelt und produziert Mikroprozessoren, Chipsätze, Grafikchips und System-on-Chip-Lösungen (SoC) für die Computer-, Kommunikations- und Endverbraucherbranchen. Seit der Ausgründung der eigentlichen Halbleiterherstellung im Jahr 2009 in Globalfoundries ist AMD fabless');
insert into manufacturers (manufacturer_name, manufacturer_description) value ('MSI', 'Micro-Star International (MSI) (chinesisch 微星科技, Pinyin Wéi Xīng Kējì – „Winziger Stern“), ein Hersteller von Computerhardware, wurde im August 1986 in Taiwan gegründet. Der Hauptsitz des Unternehmens befindet sich im Bezirk Zhonghe der Stadt Neu-Taipeh');
insert into manufacturers (manufacturer_name, manufacturer_description) value ('G.Skill', 'G.Skill International Enterprise is a Taiwanese computer hardware manufacturing company.[1] The company''s target customers are overclocking computer users. It produces a variety of high-end PC products and is best known for its RAM products.');

insert into article_category (category_name) values ('Processor');
insert into article_category (category_name) values ('Mainboard');
insert into article_category (category_name) values ('RAM');

insert into articles (category_id, manufacturer_id, article_heading, article_subtitle, rating, article_description)
values (1, 1, 'AMD Ryzen 5 3600 6x 3.60GHz So.AM4 BOX', 'EAN 0730143309936    SKU 100-100000031BOX', 5,
        'Bewährte Technologien und starke Leistung mit dem AMD Ryzen™ 5 3600 inkl. Wraith Stealth Kühler.
            Für Leistung entwickelt. Zum Siegen geschaffen.
            AMD Prozessoren der Ryzen™ 3000 Serie liefern konkurrenzlose Technologie für überragende Leistung. Erleben und nutzen Sie Technologien wie Precision Boost Overdrive, Precision Boost 2, Pure Power und AMD StoreMI und mehr, alles mit den Prozessoren der AMD Ryzen™ 3000 Serie.
            AMD Ryzen™ Prozessoren der 3. Generation mit 7nm "Zen 2"-Kern setzen Standards für hohe Leistung durch exklusive Fertigungstechnologie, bahnbrechenden Chip-Durchsatz und revolutionäre Gesamtleistung. Die Erfolgsserie des technologischen Fortschritts: AMD Ryzen™ Prozessoren der 3. Generation. Sie bietet erstmals auch Konnektivität für PCIe® 4,0, um die modernsten Mainboards, Grafikkarten und Speichertechnologien der Welt zu unterstützen. AMD Ryzen™ Prozessoren der 3. Generation liefern, was Sie brauchen, immer und überall. Der weltweit fortschrittlichste Desktop Prozessor ist nicht nur für Leistung gemacht, sondern für Gewinner.'
       );
insert into articles (category_id, manufacturer_id, article_heading, article_subtitle, rating, article_description)
values (1, 1, 'AMD Ryzen 7 3700X 8x 3.60GHz So.AM4 BOX', 'EAN 0730143309974    SKU 100-100000071BOX', 4,
        'Bewährte Technologien und starke Leistung mit dem AMD Ryzen™ 7 3700X inkl. Wraith Prism Kühler.
            Für Leistung geschaffen. Zum Siegen bestimmt.
            Volle Fahrt voraus mit der neuesten Generation des AMD Ryzen™! Sind Sie bereit für die Zukunft? Dann schnallen Sie sich an, denn ab sofort geht es mit Volldampf voraus! Die vielen praktischen Features verschaffen Ihnen ein noch nie dagewesenes Erlebnis.
            Höhere Geschwindigkeiten. Mehr Speicher. Größere Bandbreite. Hier kommt alles zusammen, damit Sie auch noch das letzte Quäntchen aus Ihrem System herausholen und alles abräumen was es abzuräumen gibt. Der AMD Ryzen™ Prozessor der 3. Generation wurde extra dafür konzipiert, um Erwartungen zu übertreffen und neue Maßstäbe für Hochleistungs-Prozessoren zu setzen.
            Der AMD Ryzen™ Prozessor der 3. Generation und 7nm "Zen 2" Architektur wird mit den modernsten Fertigungstechnologien der Welt hergestellt, für überlegene Leistung. In Kombination mit Wraith-Kühlern, die das System kühl und leise halten, liefern AMD Ryzen™ Prozessoren rekordverdächtige Leistungen. Die neuronale Intelligenz von Ryzen™ Prozessoren passt sich Ihrer Auslastung an. Diesen Vorsprung bietet nur der weltweit modernste Prozessor. Aber damit noch nicht genug. AMD Ryzen™ Prozessoren der 3. Generation bieten weltweit als erste Konnektivität für PCIe® 4.0, um die modernsten Mainboards, Grafikkarten und Speichertechnologien zu unterstützen, die es auf dem Markt gibt. AMD Ryzen™ Prozessoren der 3. Generation sind auch abwärtskompatibel mit älteren Mainboard-Generationen, um sensationellen Mehrwert und kompromisslose Leistung zu bieten.
            Gerade Gamer werden sich über mehr On-Chip-Speicher für schnelleres Spielen freuen.
            Der GameCache bietet bis zu zweimal so viel Cache wie frühere Generationen. Das reduziert die Speicherlatenz und sorgt für höhere Bildraten bei Spitzentiteln. Und wenn Ihnen das Gesamtpaket an Leistung noch nicht ausreicht, dann nutzen Sie doch einfach Precision Boost 2. Hier wird die Prozessorfrequenz automatisch erhöht. Damit erhalten Sie geballte Leistung genau dann, wenn sie am dringendsten gebraucht wird. Aber damit ist das Leistungsspektrum noch längst nicht vollends ausgeschöpft. Denn Precision Boost Overdrive nutzt die robuste Konstruktion Ihres AMD X400 Serie oder X570-basierten Mainboards, um länger höhere Taktraten zu erzielen und auf Knopfdruck zu übertakten. Weitere Features von Ryzen™ 3000 sind AMD GameCache, Precision Boost 2 oder die AMD StoreMI Technologie.'
       );
insert into articles (category_id, manufacturer_id, article_heading, article_subtitle, rating, article_description)
values (3, 3, '16GB (2x 8192MB) G.Skill Aegis DDR4-3000 DIMM CL16-18-18-38 Dual Kit', 'EAN 4719692013446    SKU F4-3000C16D-16GISB', 3,
        'Benannt nach dem mächtigen Schild der griechischen Götter, symbolisiert Aegis Stärke und Macht. Dieser neue DDR4-Speicher in der AEGIS-Gaming-Speicherfamilie wurde für eine verbesserte Leistung und hohe Stabilität auf den neuesten PC-Gaming-Systemen entwickelt. Geben Sie die Qualitätssteigerung, die Ihre Gaming-Rigs verdienen, unabhängig vom Spiel. Ob FPS, RTS, MOBA oder MMORPG, lassen Sie AEGIS Gaming DDR4 Memory die Stärke Ihres Spielarsenals sein!'
       );
insert into articles (category_id, manufacturer_id, article_heading, article_subtitle, rating, article_description)
values (2, 2, 'MSI B450 TOMAHAWK MAX AM4', 'EAN 4719072659226    SKU 7C02-020R', 5,
        'Für die Verwendung des Mainboards in Verbindung mit den AMD Ryzen™ 3000er Chipsatz kann ein BIOS-Update notwendig sein. Bitte prüfen Sie die Kompatibilität auf der Herstellerseite. Beim Kauf eines Mainboards bieten wir optional eine BIOS-Aktualisierung an und bringen die Plattform auf den neuesten Stand.
            MSI B450 TOMAHAWK MAX. Prozessorhersteller: AMD, Prozessorsockel: Socket AM4, Kompatible Prozessoren: AMD A,AMD Ryzen. Unterstützte Arbeitsspeicher: DDR4-SDRAM, Arbeitsspeicher Typ: DIMM, Unterstützte Arbeitsspeichergeschwindigkeit: 2667,2800,2933,3000,3066,3200,3466,4100,4133 MHz. Unterstützte Speicherlaufwerk-Schnittstellen: Serial ATA III. Parallele Verarbeitungstechnologie: 2-Way CrossFireX, Maximaler Grafikkartenspeicher: 2048 MB, Maximale Auflösung: 4096 x 2160 Pixel. Ethernet Schnittstellen Typ: Gigabit Ethernet, LAN-Controller: Realtek 8111H'
       );

insert into article_images (article_id, size, file_name)
values (1, null, '1313643_0__73062.jpg');
insert into article_images (article_id, size, file_name)
values (2, null, '1313645_0__73064.jpg');
insert into article_images (article_id, size, file_name)
values (3, null, '1111126_0__8729263.jpg');
insert into article_images (article_id, size, file_name)
values (4, null, '1322750_0__73322.jpg');

select art.article_id, art.article_heading, art.article_added, art.article_subtitle, art.rating, man.manufacturer_name, img.file_name from articles art
                                                                                                                                               inner join manufacturers man on man.manufacturer_id = art.manufacturer_id
                                                                                                                                               inner join article_category cat on cat.category_id = art.category_id
                                                                                                                                               inner join article_images img on img.article_id = art.article_id;

select art.article_heading, art.article_added, art.article_subtitle, art.rating, art.article_description, man.manufacturer_name, man.manufacturer_id, img.file_name from articles art
                                                                                                                                                                             inner join manufacturers man on man.manufacturer_id = art.manufacturer_id
                                                                                                                                                                             inner join article_category cat on cat.category_id = art.category_id
                                                                                                                                                                             inner join article_images img on img.article_id = art.article_id;