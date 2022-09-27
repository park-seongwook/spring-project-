-- 생성자 Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   위치:        2022-06-14 12:40:55 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE USER fs IDENTIFIED BY account
    ACCOUNT UNLOCK;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE SEQUENCE fs.fs_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 ORDER;

CREATE SEQUENCE fs.sequence2 START WITH 1 INCREMENT BY 1 MINVALUE 1 ORDER;

CREATE TABLE commentlike (
    member_memid   VARCHAR2(50) NOT NULL,
    comment_comnum NUMBER(5) NOT NULL
)
LOGGING;

CREATE TABLE comments (
    comnum       NUMBER(5) NOT NULL,
    comcontent   VARCHAR2(300),
    feed_fenum   NUMBER(5) NOT NULL,
    member_memid VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE comments ADD CONSTRAINT comment_pk PRIMARY KEY ( comnum );

CREATE TABLE feed (
    fenum        NUMBER(5) NOT NULL,
    fedate       TIMESTAMP,
    fecontent    VARCHAR2(1000),
    fescore      NUMBER(1),
    markertype   VARCHAR2(30),
    place_planum NUMBER(5) NOT NULL,
    member_memid VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE feed ADD CONSTRAINT feed_pk PRIMARY KEY ( fenum );

CREATE TABLE feedimg (
    imagenum   NUMBER(1),
    feed_fenum NUMBER(5) NOT NULL,
    filename   VARCHAR2(200),
    uploadpath VARCHAR2(200),
    uuid       VARCHAR2(200)
)
LOGGING;

CREATE TABLE feedlike (
    feed_fenum   NUMBER(5) NOT NULL,
    member_memid VARCHAR2(50) NOT NULL
)
LOGGING;

CREATE TABLE follow (
    member_memid VARCHAR2(50) NOT NULL,
    follower     VARCHAR2(50)
)
LOGGING;

CREATE TABLE hashtag (
    hashtag    VARCHAR2(30),
    feed_fenum NUMBER(5) NOT NULL
)
LOGGING;

CREATE TABLE marker (
    markertype   VARCHAR2(20),
    markerimg    VARCHAR2(100),
    member_memid VARCHAR2(50) NOT NULL
)
LOGGING;

CREATE TABLE member (
    memid       VARCHAR2(50) NOT NULL,
    memname     VARCHAR2(50),
    memaddress  VARCHAR2(200),
    memaddressx NUMBER(15, 10),
    memaddressy NUMBER(15, 10),
    memtel      VARCHAR2(13),
    filename    VARCHAR2(200),
    uploadpath  VARCHAR2(200),
    uuid        VARCHAR2(100),
    memprofile  VARCHAR2(300) DEFAULT '안녕하세요'
)
LOGGING;

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( memid );

CREATE TABLE membership (
    member_memid   VARCHAR2(60),
    membership     NUMBER(1),
    membershipdate DATE
)
LOGGING;

CREATE TABLE place (
    planum  NUMBER(5) NOT NULL,
    planame VARCHAR2(300),
    plax    NUMBER(15, 10),
    play    NUMBER(15, 10)
)
LOGGING;

ALTER TABLE place ADD CONSTRAINT place_pk PRIMARY KEY ( planum );

CREATE TABLE tag (
    feed_fenum NUMBER(5) NOT NULL,
    follower   VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE comments
    ADD CONSTRAINT comment_feed_fk FOREIGN KEY ( feed_fenum )
        REFERENCES feed ( fenum )
    NOT DEFERRABLE;

ALTER TABLE commentlike
    ADD CONSTRAINT commentlike_comment_fk FOREIGN KEY ( comment_comnum )
        REFERENCES comments ( comnum )
    NOT DEFERRABLE;

ALTER TABLE commentlike
    ADD CONSTRAINT commentlike_member_fk FOREIGN KEY ( member_memid )
        REFERENCES member ( memid )
    NOT DEFERRABLE;

ALTER TABLE feed
    ADD CONSTRAINT feed_member_fk FOREIGN KEY ( member_memid )
        REFERENCES member ( memid )
    NOT DEFERRABLE;

ALTER TABLE feed
    ADD CONSTRAINT feed_place_fk FOREIGN KEY ( place_planum )
        REFERENCES place ( planum )
    NOT DEFERRABLE;

ALTER TABLE feedimg
    ADD CONSTRAINT feedimg_feed_fk FOREIGN KEY ( feed_fenum )
        REFERENCES feed ( fenum )
    NOT DEFERRABLE;

ALTER TABLE feedlike
    ADD CONSTRAINT feedlike_feed_fk FOREIGN KEY ( feed_fenum )
        REFERENCES feed ( fenum )
    NOT DEFERRABLE;

ALTER TABLE feedlike
    ADD CONSTRAINT feedlike_member_fk FOREIGN KEY ( member_memid )
        REFERENCES member ( memid )
    NOT DEFERRABLE;

ALTER TABLE follow
    ADD CONSTRAINT follow_member_fk FOREIGN KEY ( member_memid )
        REFERENCES member ( memid )
    NOT DEFERRABLE;

ALTER TABLE hashtag
    ADD CONSTRAINT hashtag_feed_fk FOREIGN KEY ( feed_fenum )
        REFERENCES feed ( fenum )
    NOT DEFERRABLE;

ALTER TABLE marker
    ADD CONSTRAINT marker_member_fk FOREIGN KEY ( member_memid )
        REFERENCES member ( memid )
    NOT DEFERRABLE;

ALTER TABLE tag
    ADD CONSTRAINT tag_feed_fk FOREIGN KEY ( feed_fenum )
        REFERENCES feed ( fenum )
    NOT DEFERRABLE;

CREATE SEQUENCE  "FS"."FS_SEQ" INCREMENT BY 1 START WITH 1  MINVALUE 1 NOMAXVALUE NOCYCLE ORDER;

-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          2
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
