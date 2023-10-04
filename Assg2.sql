use LibrarySystem;
#1)List all the books that are written by Author Loni and has price less then 600.
select *FROM Books where Author_name='Loni' and Cost<600;
#2)	List the Issue details for the books that are not returned yet.
SELECT
    I.Lib_Issue_ID,
    b.Book_Name,
    m.Member_Name,
    I.Issue_Date
FROM
    Issue AS I
JOIN
    Books AS B ON I.Book_No = B.Book_No
JOIN
    Members AS M ON I.Member_ID = M.Member_ID
WHERE
    I.Return_Date IS NULL;
#3)	Update all the blank return_date with 31-Dec-06 excluding 7005 and 7006.
update Issue set return_date='31-12-06'WHERE Return_Date IS NULL AND Lib_Issue_Id NOT IN (7005, 7006);
#4)	List all the Issue details that have books issued for more then 30 days.
Select *FROM ISSUE;

