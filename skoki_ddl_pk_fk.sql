--------------------------------------------------------
--  DDL for Table TEKMOVALCI
--------------------------------------------------------

  CREATE TABLE "SSK1_TEKMOVALCI" 
   (  "ID_TEKMOVALCA" NUMBER(7), 
  "IME" VARCHAR2(20), 
  "PRIIMEK" VARCHAR2(20), 
  "ID_DRZAVE" NUMBER(7)
   );
--------------------------------------------------------
--  DDL for Table DRZAVE
--------------------------------------------------------

  CREATE TABLE "SSK1_DRZAVE" 
   (  "ID_DRZAVE" NUMBER(7), 
  "DRZAVA" VARCHAR2(20)
   );
--------------------------------------------------------
--  DDL for Table SKAKALNICE
--------------------------------------------------------

  CREATE TABLE "SSK1_SKAKALNICE" 
   (  "ID_SKAKALNICE" NUMBER(7), 
  "IME_SKAKALNICE" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table SKOKI
--------------------------------------------------------

  CREATE TABLE "SSK1_SKOKI" 
   (  "ID_SKOKA" NUMBER(7), 
  "ID_TEKMOVANJA" NUMBER(7), 
  "ID_TEKMOVALCA" NUMBER(7), 
  "SERIJA" VARCHAR2(3), 
  "DOLZINA_SKOKA" NUMBER(4,1), 
  "OCENA_SKOKA" NUMBER(4,1), 
  "ID_STATUSA" NUMBER(2), 
  "PRIJAVE_ZAKLJUCENE" VARCHAR2(1) DEFAULT 'N', 
  "STARTNI_CAS" DATE, 
  "DATUM_PRIJAVE" DATE
   );
--------------------------------------------------------
--  DDL for Table TEKMOVANJA
--------------------------------------------------------

  CREATE TABLE "SSK1_TEKMOVANJA" 
   (  "ID_TEKMOVANJA" NUMBER(7), 
  "NAZIV" VARCHAR2(20), 
  "DATUM" DATE, 
  "ID_SKAKALNICE" NUMBER(7)
   );
--------------------------------------------------------
--  DDL for Table SKOK_STATUSI
--------------------------------------------------------

  CREATE TABLE "SSK1_SKOK_STATUSI" 
   (  "ID_STATUSA" NUMBER(7), 
  "STATUS" VARCHAR2(20)
   );

--------------------------------------------------------
--  Constraints for Table DRZAVE
--------------------------------------------------------
  ALTER TABLE "SSK1_DRZAVE" ADD CONSTRAINT "SSK1_DRZAVE_PK" PRIMARY KEY ("ID_DRZAVE");
--------------------------------------------------------
--  Constraints for Table TEKMOVALCI
--------------------------------------------------------
  ALTER TABLE "SSK1_TEKMOVALCI" ADD CONSTRAINT "SSK1_TEKMOVALCI_PK" PRIMARY KEY ("ID_TEKMOVALCA");
  ALTER TABLE "SSK1_TEKMOVALCI" ADD CONSTRAINT "tekm_drz_fk" FOREIGN KEY (ID_DRZAVE) REFERENCES SSK1_DRZAVE (ID_DRZAVE);
--------------------------------------------------------
--  Constraints for Table SKAKALNICE
--------------------------------------------------------
  ALTER TABLE "SSK1_SKAKALNICE" ADD CONSTRAINT "SSK1_SKAKALNICE_PK" PRIMARY KEY ("ID_SKAKALNICE");
--------------------------------------------------------
--  Constraints for Table SKOK_STATUSI
--------------------------------------------------------
  ALTER TABLE "SSK1_SKOK_STATUSI" ADD CONSTRAINT "SSK1_SKOK_STATUSI_PK" PRIMARY KEY ("ID_STATUSA");
  
--------------------------------------------------------
--  Constraints for Table TEKMOVANJA
--------------------------------------------------------
  ALTER TABLE "SSK1_TEKMOVANJA" ADD CONSTRAINT "SSK1_TEKMOVANJA_PK" PRIMARY KEY ("ID_TEKMOVANJA");
  ALTER TABLE "SSK1_TEKMOVANJA" ADD CONSTRAINT "tekm_skak_fk" FOREIGN KEY (ID_SKAKALNICE) REFERENCES SSK1_SKAKALNICE (ID_SKAKALNICE);
--------------------------------------------------------
--  Constraints for Table SKOKI
--------------------------------------------------------
  ALTER TABLE "SSK1_SKOKI" ADD CONSTRAINT "SSK1_SKOKI_PK" PRIMARY KEY ("ID_SKOKA");
  ALTER TABLE "SSK1_SKOKI" ADD CONSTRAINT "skok_stats_fk" FOREIGN KEY (ID_STATUSA) REFERENCES SSK1_SKOK_STATUSI (ID_STATUSA);
  ALTER TABLE "SSK1_SKOKI" ADD CONSTRAINT "skok_tekmo_fk" FOREIGN KEY (ID_TEKMOVANJA) REFERENCES SSK1_TEKMOVANJA (ID_TEKMOVANJA);
  ALTER TABLE "SSK1_SKOKI" ADD CONSTRAINT "skok_tekmv_fk" FOREIGN KEY (ID_TEKMOVALCA) REFERENCES SSK1_TEKMOVALCI (ID_TEKMOVALCA);
