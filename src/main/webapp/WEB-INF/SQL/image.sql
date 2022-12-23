DROP INDEX PK_IMAGE;

/* 이미지 */
DROP TABLE IMAGE 
  CASCADE CONSTRAINTS;

/* 이미지 */
CREATE TABLE IMAGE (
  IMAGE_NO NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1), /* 이미지번호 */
  GUBUN NUMBER(2), /* 구분 */
  IMAGE_M NUMBER, /* 공통이미지 */
  MAIN_IMAGE NUMBER, /* 메인이미지 */
  ORG_NAME VARCHAR2(500), /* 원본파일명 */
  SAVE_NAME VARCHAR2(500), /* 저장파일명 */
  PATH VARCHAR2(256) DEFAULT '1', /* 경로 */
  FILE_SIZE NUMBER, /* 파일용량 */
  FILE_EXT VARCHAR2(10), /* 확장자 */
  FROM_TB NUMBER, /* 출처 */
  FROM_NO NUMBER, /* 출처번호 */
  REG_DT DATE DEFAULT SYSDATE, /* 저장일 */
  MOD_DT DATE DEFAULT SYSDATE /* 수정일 */
);

COMMENT ON TABLE IMAGE IS '이미지';

COMMENT ON COLUMN IMAGE.IMAGE_NO IS '이미지번호';

COMMENT ON COLUMN IMAGE.GUBUN IS '구분';

COMMENT ON COLUMN IMAGE.IMAGE_M IS '공통이미지';

COMMENT ON COLUMN IMAGE.MAIN_IMAGE IS '메인이미지';

COMMENT ON COLUMN IMAGE.ORG_NAME IS '원본파일명';

COMMENT ON COLUMN IMAGE.SAVE_NAME IS '저장파일명';

COMMENT ON COLUMN IMAGE.PATH IS '경로';

COMMENT ON COLUMN IMAGE.FILE_SIZE IS '파일용량';

COMMENT ON COLUMN IMAGE.FILE_EXT IS '확장자';

COMMENT ON COLUMN IMAGE.FROM_TB IS '출처';

COMMENT ON COLUMN IMAGE.FROM_NO IS '출처번호';

COMMENT ON COLUMN IMAGE.REG_DT IS '저장일';

COMMENT ON COLUMN IMAGE.MOD_DT IS '수정일';

CREATE UNIQUE INDEX PK_IMAGE
  ON IMAGE (
    IMAGE_NO ASC
  );

ALTER TABLE IMAGE
  ADD
    CONSTRAINT PK_IMAGE
    PRIMARY KEY (
      IMAGE_NO
    );