CREATE TRIGGER song_restrict_tgr
BEFORE INSERT
ON public.song
FOR EACH ROW
EXECUTE PROCEDURE public.song_restrict();
