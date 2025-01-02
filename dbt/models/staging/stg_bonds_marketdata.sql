WITH staging as (
	SELECT
		secid,
		boardid,
		open,
		low,
		high,
		last,
		bid,
		offer,
		spread,
		biddeptht,
		offerdeptht,
		lastchange,
		lastchangeprcnt,
		qty,
		value,
		value_usd,
		yield,
		yieldatwaprice,
		yieldtoprevyield,
		lasttoprevprice,
		numtrades,
		voltoday,
		valtoday,
		valtoday_usd,
		valtoday_rur,
		parseDateTimeBestEffortOrNull( concat(toString(toDate(systime)), ' ', updatetime), 'UTC' ) as updatetime_dt,
		duration,
		change,
		parseDateTimeBestEffortOrZero(systime, 'UTC') as systime_dt,
		yieldlastcoupon
	FROM {{ source('moex_data', 'src_bonds_marketdata') }}
)

SELECT
	secid,
	boardid,
	open,
	low,
	high,
	last,
	bid,
	offer,
	spread,
	biddeptht,
	offerdeptht,
	lastchange,
	lastchangeprcnt,
	qty,
	value,
	value_usd,
	yield,
	yieldatwaprice,
	yieldtoprevyield,
	lasttoprevprice,
	numtrades,
	voltoday,
	valtoday,
	valtoday_usd,
	valtoday_rur,
	updatetime_dt as updatetime,
	duration,
	change,
	systime_dt as systime,
	yieldlastcoupon
FROM staging