-- FUNCTION: public.cd_Album()

-- DROP FUNCTION public."cd_Album"();

CREATE OR REPLACE FUNCTION public."cd_Album"(
	)
RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$
DECLARE
percentage_cd decimal;

begin
select ((select count(*)::decimal from album where "Format" = 'CD') / (select count(*)::decimal from album))::decimal(10,2) * 100 
into percentage_cd;
return percentage_cd;
end;
$BODY$;

ALTER FUNCTION public."cd_Album"()
    OWNER TO cs4222s46;

COMMENT ON FUNCTION public."cd_Album"()
    IS 'Calculates Percentage of CD Albums in Album table';
