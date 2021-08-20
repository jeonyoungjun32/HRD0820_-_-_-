create table tbl_product(
p_code char(4)not null primary key,
p_name varchar2(20),
p_size varchar2(40),
p_type varchar2(20),
p_price number(7)
);

drop table tbl_product;

select * tbl_product
insert into tbl_product values('A001','A-1형소형박스','100 X 110 X 50','A골판지','5000');
insert into tbl_product values('A002','A-2형소형박스','100 X 110 X 70','A골판지','6000');
insert into tbl_product values('A003','A-3형소형박스','100 X 110 X 100','A골판지','7000');
insert into tbl_product values('B001','B-1중형형박스','150 X 130 X 50','B골판지','10000');
insert into tbl_product values('B002','B-2중형형박스','150 X 130 X 70','B골판지','11000');
insert into tbl_product values('B003','B-3중형형박스','150 X 130 X 100','B골판지','13000');
insert into tbl_product values('C001','C-1대형형박스','180 X 150 X 50','C골판지','15000');
insert into tbl_product values('C002','C-2대형형박스','180 X 150 X 70','C골판지','17000');
insert into tbl_product values('C003','C-3대형형박스','180 X 150 X 100','C골판지','20000');

select * from tbl_product


drop table tbl_worklist

create table tbl_worklist(
w_workno char(8) not null primary key,
p_code char(4),
w_quantity number(5),
w_workdate date
);
select * from tbl_worklist

insert into tbl_worklist values('20190001','A001','100','19/11/01');
insert into tbl_worklist values('20190002','A002','150','19/11/01');
insert into tbl_worklist values('20190003','A003','200','19/11/01');
insert into tbl_worklist values('20190004','B001','250','19/11/02');
insert into tbl_worklist values('20190005','B002','100','19/11/02');
insert into tbl_worklist values('20190006','B003','150','19/11/02');
insert into tbl_worklist values('20190007','A001','100','19/11/03');
insert into tbl_worklist values('20190008','A002','150','19/11/03');
insert into tbl_worklist values('20190009','A003','200','19/11/03');

drop table tbl_process
create table tbl_process(
w_workno char(8)not null primary key,
p_p1 char(1),
p_p2 char(1),
p_p3 char(1),
p_p4 char(1),
p_p5 char(1),
p_p6 char(1),
w_lastdate char(8),
w_lasttime char(4)
);

select * from tbl_process

insert into tbl_process values('20190001','Y','Y','Y','Y','Y','Y','20191001','0930');
insert into tbl_process values('20190002','Y','Y','Y','Y','Y','Y','20191001','1030');
insert into tbl_process values('20190003','Y','Y','Y','Y','Y','Y','20191001','1130');
insert into tbl_process values('20190004','Y','Y','Y','Y','Y','N','20191002','1330');
insert into tbl_process values('20190005','Y','Y','Y','Y','Y','N','20191002','1430');
insert into tbl_process values('20190006','Y','Y','Y','Y','Y','N','20191002','1530');
insert into tbl_process values('20190007','Y','Y','Y','Y','N','N','20191003','1630');
insert into tbl_process values('20190008','Y','Y','Y','Y','N','N','20191003','1730');

--select.jsp
select p_code, p_name, p_size, p_type, to_char(p_price,'$999,999,999') from tbl_product





--select2.jsp
select substr(w_workno,1,4)||'-'||substr(w_workno,5,4), p_code, p_name, p_size, p_type, w_quantity, to_char(w_workdate,'yyyy-mm-dd')
from tbl_product natural join tbl_worklist

select *
from tbl_product natural join tbl_worklist
-------------------------
--select3.jsp
select substr(w_workno,1,4)||'-'||substr(w_workno,5,4),
p_code, p_name,
decode(p_p1,'Y','완료','N','~'),
decode(p_p2,'Y','완료','N','~'),
decode(p_p3,'Y','완료','N','~'),
decode(p_p4,'Y','완료','N','~'),
decode(p_p5,'Y','완료','N','~'),
decode(p_p6,'Y','완료','N','~'),
to_char(to_date(w_lastdate),'yyyy-mm-dd'),
substr(w_lasttime,1,2)||':'||substr(w_lasttime,3,2)
from tbl_process natural join (select w_workno, p_code, p_name
								from tbl_product natural join tbl_worklist)
								order by 1;
ORDER by

select substr(w_workno,1,4)||'-'||substr(w_workno,5,4)
from tbl_process

select to_char(to_date(w_lastdate),'yyyy-dd-mm')
from tbl_process

--select3
--[1]
select w_workno, p_code, p_name
from tbl_product natural join tbl_worklist;
--[2]
select substr(w_workno,1,4)||'-'||substr(w_workno,5,4),
p_code, p_name,
decode(p_p1,'Y','완료','N','~'),
decode(p_p2,'Y','완료','N','~'),
decode(p_p3,'Y','완료','N','~'),
decode(p_p4,'Y','완료','N','~'),
decode(p_p5,'Y','완료','N','~'),
decode(p_p6,'Y','완료','N','~'),
to_char(to_date(w_lastdate),'yyyy-mm-dd'),
substr(w_lasttime,1,2)||':'||substr(w_lasttime,3,2)
from tbl_process natural join (select w_workno, p_code, p_name
								from tbl_product natural join tbl_worklist);
sql = "select w_workno, p_code, p_name, p_p1, p_p2, p_p3,p_p4, p_p5, p_p6, w_lastdate, w_lasttime";
sql += " from tbl_product natural join tbl_process ";
sql += " where w_workno = ?";
