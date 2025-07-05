-- BillReducGas 
-- 20250705

SUM(
	CASE
		WHEN NOT ISNULL(ft.FuelType,0) = '0' 
			OR (Thm1  (ISNULL(RateG1, 0) + ISNULL(RateGFrac1,0)) + Thm2  (ISNULL(RateGFrac2_1,0)+ISNULL(RateG2,0)+ISNULL(RateGFrac2_2,0))) > 0
		THEN
			ISNULL(
				-Qty *
				IR *
				RR *
				( NTGRThm + @MEBens ) *
				(
					Thm1 *
					(
						ISNULL( RateG1, 0 ) +
						ISNULL( RateGFrac1, 0 )
					) +
					Thm2 *
					(
						ISNULL( RateGFrac2_1, 0 ) +
						ISNULL( RateG2, 0 ) +
						ISNULL( RateGFrac2_2, 0 )
					)
				), 0
			)
		ELSE 0
	END)