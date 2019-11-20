--Restriccion de claves PK--

ALTER TABLE musician ADD CONSTRAINT PK_musician PRIMARY KEY(m_no);
ALTER TABLE band ADD  CONSTRAINT  PK_band  PRIMARY KEY(band_no);
ALTER TABLE composer ADD CONSTRAINT PK_composer PRIMARY KEY(comp_no);
ALTER TABLE composition ADD CONSTRAINT PK_composition PRIMARY KEY(c_no);
ALTER TABLE concert ADD CONSTRAINT PK_concert PRIMARY KEY(concert_no);
ALTER TABLE performance ADD CONSTRAINT PK_performance PRIMARY KEY(pfrmnc_no);
ALTER TABLE performer ADD CONSTRAINT PK_performer PRIMARY KEY(perf_no);
ALTER TABLE place ADD CONSTRAINT PK_place PRIMARY KEY(place_no);
ALTER TABLE has_composed ADD  CONSTRAINT PK_has_composed PRIMARY KEY(cmpn_no,cmpr_no);
ALTER TABLE plays_in ADD CONSTRAINT  PK_plays_in PRIMARY KEY(player,band_id);

--Restriccion de claves UK--

ALTER TABLE place ADD CONSTRAINT UK_place_place_town UNIQUE (place_town);
ALTER TABLE band ADD CONSTRAINT UK_band_band_name UNIQUE (band_name);
ALTER TABLE composition ADD  CONSTRAINT UK_composition_c_title UNIQUE (c_title);

--Restriccion de claves FK--

ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_band  FOREIGN KEY(band_id) REFERENCES band(band_no);
ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_performer  FOREIGN KEY(player) REFERENCES performer(perf_no); 

ALTER TABLE musician ADD CONSTRAINT FK_musician_place  FOREIGN KEY(born_in) REFERENCES place(place_no);
ALTER TABLE musician ADD CONSTRAINT FK_musician_place1  FOREIGN KEY(living_in) REFERENCES place(place_no);

ALTER TABLE band ADD CONSTRAINT FK_band_place FOREIGN KEY(band_home) REFERENCES place(place_no);
ALTER TABLE band ADD CONSTRAINT FK_band_musician  FOREIGN KEY(band_contact) REFERENCES musician(m_no);

ALTER TABLE performance ADD CONSTRAINT FK_performance_band  FOREIGN KEY(gave) REFERENCES band(band_no);
ALTER TABLE performance ADD CONSTRAINT FK_performance_composition FOREIGN KEY(performed) REFERENCES composition(c_no);
ALTER TABLE performance ADD CONSTRAINT FK_performance_musician  FOREIGN KEY(conducted_by) REFERENCES musician(m_no);
ALTER TABLE performance ADD CONSTRAINT FK_performance_concert  FOREIGN KEY(performed_in) REFERENCES concert(concert_no);


ALTER TABLE performer ADD CONSTRAINT FK_performer_musician  FOREIGN KEY(perf_is) REFERENCES musician(m_no);
ALTER TABLE composition ADD CONSTRAINT FK_compostion_place  FOREIGN KEY(c_in) REFERENCES place(place_no);
ALTER TABLE composer ADD CONSTRAINT FK_composer_musician FOREIGN KEY(comp_is) REFERENCES musician(m_no);
ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composer  FOREIGN KEY (cmpr_no) REFERENCES composer(comp_no);
ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composition  FOREIGN KEY (cmpn_no) REFERENCES composition(c_no);

ALTER TABLE concert ADD CONSTRAINT FK_concert_performance  FOREIGN KEY(concert_in) REFERENCES place(place_no);
ALTER TABLE concert ADD CONSTRAINT FK_concert_musician FOREIGN KEY(concert_orgniser) REFERENCES musician(m_no);
