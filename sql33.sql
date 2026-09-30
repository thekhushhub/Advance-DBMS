--definition 3
create or replace procedure search_emp(xempid in number,enm OUT char)
is
begin
	select emp_name INTO enm from emp where
	emp_no=xempid;
EXCEPTION
	when no_Data_Found then
	dbms_output.put_line('ID not found');
end search_emp;
/