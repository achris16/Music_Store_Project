CREATE FUNCTION public.remove_album()
    RETURNS trigger
    LANGUAGE 'plpgsql'
     NOT LEAKPROOF
AS $BODY$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		IF ((select count(*) from song where album_id = old.album_id) = 1) THEN
			delete from ablum where id = old.album_id;
		END IF;
		RETURN OLD;
	ELSE
		RETURN NEW;
	END IF;
END;
$BODY$;

ALTER FUNCTION public.remove_album()
    OWNER TO cs4222s46;

COMMENT ON FUNCTION public.remove_album()
    IS 'Remove an album if all songs in the album are deleted.';
