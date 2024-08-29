create trigger update_img_groupimgfk
    after insert
    on img_group
    for each row
BEGIN
    UPDATE img
    SET group_no = NEW.group_no
    WHERE img.group_no IS NULL  -- 이미 NULL인 경우에만 업데이트하고
      AND img.no = NEW.img_no;  -- 해당하는 img_group 번호에 맞는 경우에만 업데이트합니다.
END;