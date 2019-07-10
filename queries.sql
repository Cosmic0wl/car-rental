
 -- QUERIES --

SELECT * 
FROM vehicles 
WHERE fk_branch_id = 1 AND  vehicle_id NOT IN (SELECT fk_vehicle_id FROM reservations WHERE rental_date < '2019-07-30' AND return_date > '2019-07-30');

-- Sum of grand total of all invoices between August and November for branch nr 1 --

SELECT SUM(grand_total)
FROM invoices JOIN employees ON fk_employee_id = employee_id
WHERE date_of_issue BETWEEN '2019-08-01' AND '2019-11-30' AND fk_branch_id = 1;

-- History of maintanence for vehicle nr 5 -- 

SELECT date_of_maintenance, report, mileage, maintenance_cost 
FROM maintenance_services JOIN vehicles on fk_vehicle_id = vehicle_id
WHERE fk_vehicle_id = 5;

-- Pending reservations for customer nr 1 --

SELECT last_name, model, deposit, rental_fee, rental_date, return_date
FROM reservations JOIN customers on fk_customer_id = customer_id JOIN vehicles on fk_vehicle_id = vehicle_id
WHERE fk_customer_id = 1 AND rental_date = '2019-06-12';

-- Employee wage costs per branch --

SELECT branch.name, SUM(salary) 
FROM roles JOIN employees on fk_role_id = role_id JOIN agency_branches branch on fk_branch_id = branch.branch_id
GROUP BY branch_id;

-- Employee ranking by grand total of cashed invoices --

SELECT employee.first_name, employee.last_name, SUM(grand_total)
FROM invoices JOIN employees employee on fk_employee_id = employee.employee_id
GROUP BY employee.employee_id
ORDER BY SUM(grand_total) DESC;

-- Employee ranking by grand total of cashed invoices with all clerks --

SELECT employee.first_name, employee.last_name, SUM(grand_total)
FROM invoices invoice RIGHT JOIN employees employee on invoice.fk_employee_id = employee.employee_id JOIN roles role on role.role_id = employee.fk_role_id
WHERE role.name = 'Clerk'
GROUP BY employee.employee_id
ORDER BY SUM(grand_total) DESC;

-- Additional charges for invoice nr 3 --

SELECT name, quantity, quantity * cost
FROM invoices JOIN additional_charges_to_invoices on fk_invoice_id = invoice_id JOIN additional_charges on fk_charges_id = charges_id
WHERE invoice_id = 3;
