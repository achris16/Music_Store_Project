CREATE TRIGGER remove_album_tgr
BEFORE DELETE
ON public.song
FOR EACH ROW
EXECUTE PROCEDURE public.remove_album();