-- BillIncrElec
-- 20250703

SUM(
	CASE
		WHEN NOT ISNULL(ft.FuelType,0) = '0'
			AND (kWh1 * (ISNULL(RateE1, 0) + ISNULL(RateEFrac1,0)) + kWh2 * (ISNULL(RateEFrac2_1,0)+ISNULL(RateE2,0)+ISNULL(RateEFrac2_2,0))) < 0
		THEN ISNULL(
			Qty *
			IR *
			RR *
			( NTGRkWh + @MEBens ) *
			(
				kWh1 *
				(
					ISNULL( RateE1, 0 ) +
					ISNULL( RateEFrac1, 0 )
				) +
				kWh2 *
				(
					ISNULL( RateEFrac2_1, 0 ) +
					ISNULL( RateE2, 0 ) +
					ISNULL( RateEFrac2_2, 0 )
				)
			), 0
		)
		ELSE 0
	END)