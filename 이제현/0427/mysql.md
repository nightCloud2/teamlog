select s.no as s_no, i.imgtype, s.title as s_title, s.price as s_price, s.r_date as s_r_date, i.file_rt, i.u_name, i.o_name, i.e_name
from img i, sale s, sale_img si
where si.sal_no = s.no and si.img_no = i.no and i.imgtype = 'w' and s.no = 85;

select s.no as s_no, i.imgtype, s.title as s_title, s.price as s_price, s.r_date as s_r_date, i.file_rt, i.u_name, i.o_name, i.e_name
from img i, sale s, sale_img si
where si.sal_no = s.no and si.img_no = i.no and i.imgtype = 's' and i.state = 'Y' order by s.r_date desc limit 10;
