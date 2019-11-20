ALTER TABLE musician ADD CONSTRAINT CK_musician_m_name CHECK(REGEXP_LIKE (m_name,'^[A-Za-z]+ [A-Za-z]+$'));
ALTER TABLE musician ADD CONSTRAINT CK_musician_born_died CHECK (died > born);
ALTER TABLE composer ADD CONSTRAINT CK_composer_comp_type CHECK (comp_type IN ('jazz', 'classical', 'rock', 'blues','not known'));