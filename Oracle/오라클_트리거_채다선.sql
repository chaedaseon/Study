SELECT USER
FROM DUAL;
--==>> SCOTT

--○ TBL_출고 테이블의 데이터 입력, 수정, 삭제 시
--   TBL_상품 테이블의 해당 상품에 대한 재고수량 변동 트리거 작성
--   트리거명 : TRG_CHULGO
--   제출 파일명 : 오라클_트리거_채다선.sql
--   재고 부족 관련 예외 처리할 것
CREATE OR REPLACE TRIGGER TRG_CHULGO
        AFTER
        INSERT OR UPDATE OR DELETE ON TBL_출고
        FOR EACH ROW
DECLARE
    V_재고수량  TBL_상품.재고수량%TYPE;
BEGIN

    IF (INSERTING)
        THEN 
        
        SELECT 재고수량 INTO V_재고수량
        FROM TBL_상품
        WHERE 상품코드 = :NEW.상품코드;
        
        IF (:NEW.출고수량 > V_재고수량)
            THEN RAISE_APPLICATION_ERROR(-20002, '재고 부족~!!!');
        END IF;
         
        UPDATE TBL_상품
        SET 재고수량 = 재고수량 - :NEW.출고수량
        WHERE 상품코드 = :NEW.상품코드;
         
    ELSIF (UPDATING)
        THEN
        
        SELECT 재고수량 INTO V_재고수량
        FROM TBL_상품
        WHERE 상품코드 = :NEW.상품코드;
        
        IF (:NEW.출고수량 > V_재고수량 + :OLD.출고수량)
            THEN RAISE_APPLICATION_ERROR(-20002, '재고 부족~!!!');
        END IF;
        
        UPDATE TBL_상품
        SET 재고수량 = 재고수량 + :OLD.출고수량 - :NEW.출고수량
        WHERE 상품코드 = :OLD.상품코드;
        
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :OLD.출고수량
             WHERE 상품코드 = :OLD.상품코드;
    END IF;  
END;
--==>> Trigger TRG_CHULGO이(가) 컴파일되었습니다.




