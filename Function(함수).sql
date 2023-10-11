WINDOW
SQL 에서 사용되는 분석 함수
        결과 집합 내에서 행의 순서와 관련된 계산을 수행할 수 있음
        집계,순위,평균,합계 등을 계산할 때 유용
데이터를 파티션 별로 분할하고 순서를 정의한 다음 각 파티션 내에 계산을 수행
<윈도우함수>(<표현식>)OVER(
          PARTITION BY <파티션 열>
          ORDER BY <정렬 열>
          ROWS BETWEEN <시작 행>AND <끝 행>
      )
<윈도우함수> : 사용할 윈도우 함수 작성
                ex)SUM,AV< RANK 등
<표현 식> : 계산을 수행할 열 또는 식
PARTITION BY : 데이터를 파티션으로 나누는데 사용할 열을 지정
ORDER BY : 각 파티션 내에서 행 순서를 정의하는데 사용할 열을 지정
ROWS BETWEEN : 계산을 수행할 행의 범위를 정의하는데 사용
SELECT order_id,order_date,total_price,
    SUM(total_price) OVER (ORDER BY order_date) AS OD FROM orders;
: 이 부분이 윈도우 함수
 이 함수는 ORDER_date를 기준으로 각 주문의 총 가격을 누적한 값을 반환한것
    이 결과 집합에는 order_id,order_date<total_price<OD 열이 포함
    각 주문에 대한 누적 가격을 계산할 수 있음
