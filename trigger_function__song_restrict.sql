CREATE FUNCTION public.song_restrict()
    RETURNS trigger
    LANGUAGE 'plpgsql'
     NOT LEAKPROOF
AS $BODY$
BEGIN
	if ((select count(distinct title) from song where album_id = new.album_id) > 14) then
		raise exception 'Maximum number of songs exceeded!';
	end if;
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.song_restrict()
    OWNER TO cs4222s46;

COMMENT ON FUNCTION public.song_restrict()
    IS 'a trigger to ensure that an album contains no more than 15 songs.';
