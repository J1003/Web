--BBS (bulletin board system) : 전자 게시판 시스템
--게시글 테이블
CREATE TABLE BBS (
    BBS_IDX NUMBER(6) CONSTRAINT BBS_PK PRIMARY KEY,
    SUBJECT VARCHAR2(150), --글제목
    WRITER VARCHAR2(30), --작성자
    --CONTENT CLOB, --글내용
    CONTENT VARCHAR2(4000), --글내용
    FILE_NAME VARCHAR2(100), --실제 저장되는 파일명
    ORI_NAME VARCHAR2(100), --원본파일명
    PWD VARCHAR2(20), --암호
    WRITE_DATE DATE DEFAULT SYSDATE, --작성일시
    IP VARCHAR2(15), --작성자 IP주소
    HIT NUMBER(5) --조회수
);

--게시글에 대한 댓글(COMMENT)
CREATE TABLE COMMENTS (
    COMMENT_IDX NUMBER(6) CONSTRAINT COMMENTS_PK PRIMARY KEY,
    WRITER VARCHAR2(30),
    --CONTENT CLOB,
    CONTENT VARCHAR2(2000),
    PWD VARCHAR2(20),
    WRITE_DATE DATE DEFAULT SYSDATE,
    IP VARCHAR2(15),
    BBS_IDX NUMBER(6), -- 게시글 번호
    CONSTRAINT COMMMENTS_FK FOREIGN KEY (BBS_IDX) REFERENCES BBS(BBS_IDX)
);
--시퀀스 추가
CREATE SEQUENCE BBS_SEQ NOCACHE;
CREATE SEQUENCE COMMENTS_SEQ NOCACHE;
-----------------------------------------
--글 목록 조회를 위한 샘플 데이터 작성
INSERT INTO BBS
       (BBS_IDX, SUBJECT, WRITER, CONTENT, FILE_NAME, 
        ORI_NAME, PWD, WRITE_DATE, IP, HIT )
VALUES (BBS_SEQ.NEXTVAL, '테스트1', '테스터', '테스트1-내용', '', 
        '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트2', '테스터', '테스트2-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트3', '테스터', '테스트3-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트4', '테스터', '테스트4-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트5', '테스터', '테스트5-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트6', '테스터', '테스트6-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트7', '테스터', '테스트7-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트8', '테스터', '테스트8-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트9', '테스터', '테스트9-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
INSERT INTO BBS
VALUES (BBS_SEQ.NEXTVAL, '테스트10', '테스터', '테스트10-내용', '', '', '1234', SYSDATE, '127.0.0.1', 0);
COMMIT;
----------
INSERT INTO COMMENTS
       (COMMENT_IDX, WRITER, CONTENT, PWD, WRITE_DATE, 
       IP, BBS_IDX)
VALUES (COMMENTS_SEQ.NEXTVAL, 'C테스터', 'C-내용1', '1234', SYSDATE, 
       '127.0.0.1', 10);
INSERT INTO COMMENTS
VALUES (COMMENTS_SEQ.NEXTVAL, 'C테스터', 'C-내용2', '1234', SYSDATE, '127.0.0.1', 10);
INSERT INTO COMMENTS
VALUES (COMMENTS_SEQ.NEXTVAL, 'C테스터', 'C-내용3', '1234', SYSDATE, '127.0.0.1', 10);
COMMIT;










