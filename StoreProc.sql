CREATE DEFINER=`root`@`localhost` PROCEDURE `rate_suppliers`()
BEGIN
select s.SUPP_ID, s.SUPP_NAME, r.RAT_RATSTARS, 
	CASE
		when r.RAT_RATSTARS > 4 then 'Genuine Supplier'
        when r.RAT_RATSTARS > 2 then 'Average Supplier'
        when r.RAT_RATSTARS <= 2 then 'Supplier should not be considered'
        END as Verdict from rating r inner join supplier s on s.SUPP_ID=r.SUPP_ID;
END