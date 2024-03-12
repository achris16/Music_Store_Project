CREATE OR REPLACE FUNCTION public.total_songs()
    RETURNS integer
    LANGUAGE 'plpgsql'
    VOLATILE
    COST 100
AS $BODY$
DECLARE
total_songs integer;

BEGIN
select count(*) from song into total_songs;
return total_songs;
END;
$BODY$;