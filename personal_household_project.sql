SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'expenses'
ORDER BY ordinal_position;

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name ILIKE '%expense%';


SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;


CREATE TABLE expenses (
    expense_id SERIAL PRIMARY KEY,
    expense_date DATE NOT NULL,
    category_id INT REFERENCES expense_categories(category_id),
    subcategory_id INT REFERENCES expense_subcategories(subcategory_id),
    amount NUMERIC(10,2) NOT NULL,
    member_id INT REFERENCES family_members(member_id),
    vendor_id INT REFERENCES vendors(vendor_id),
    payment_method_id INT REFERENCES payment_methods(payment_method_id),
    description TEXT,
    recurring BOOLEAN,
    status VARCHAR(20)
);

SELECT * FROM expense_categories;

SELECT *
FROM expense_subcategories
ORDER BY subcategory_id;

SELECT * FROM family_members;

SELECT * FROM payment_methods;

SELECT * FROM vendors;

INSERT INTO expenses
(expense_date, category_id, subcategory_id, amount, member_id, vendor_id, payment_method_id, description, recurring, status)
VALUES
('2026-03-02', 1, 1, 12000, 1, 1, 1, 'Monthly grocery', TRUE, 'Paid'),
('2026-03-03', 1, 2, 540, 2, 2, 1, 'Weekly Grocery', TRUE, 'Paid'),
('2026-03-05', 2, 5, 1500, 1, 3, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-03-07', 2, 8, 349, 3, 4, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-03-09', 7, 20, 10000, 1, 5, 2, 'Fuel Expense', FALSE, 'Paid'),
('2026-03-10', 2, 7, 921.50, 2, 6, 2, 'Monthly Utilities', FALSE, 'Paid'),
('2026-03-12', 10, 31, 2500, 2, 7, 3, 'New Clothes', FALSE, 'Paid'),
('2026-03-14', 2, 9, 849, 3, 8, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-03-16', 2, 6, 500, 2, 9, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-03-18', 1, 3, 961, 1, 10, 1, 'Monthly Grocery', TRUE, 'Paid'),
('2026-03-19', 3, 10, 10000, 1, 11, 2, 'Monthly Housing', TRUE, 'Paid'),
('2026-03-21', 3, 11, 500, 3, 12, 2, 'Monthly Housing', TRUE, 'Paid'),
('2026-03-23', 9, 28, 25000, 1, 13, 5, 'Semester Fee', TRUE, 'Paid'),
('2026-03-24', 2, 47, 200, 1, 14, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-03-25', 14, 41, 499, 3, 15, 2, 'Monthly Subscription', TRUE, 'Paid'),
('2026-03-27', 13, 39, 12000, 4, 16, 5, 'Monthly Transportation', TRUE, 'Paid'),
('2026-03-29', 9, 29, 1500, 5, 17, 1, 'College Study Books', FALSE, 'Paid'),
('2026-03-30', 11, 13, 700, 2, 18, 1, 'Plumbing repair', FALSE, 'Paid'),
('2026-03-31', 5, 16, 3000, 2, 19, 1, 'Monthly medicines', FALSE, 'Paid');

SELECT * FROM expenses;

SELECT *
FROM expenses
ORDER BY expense_date;

INSERT INTO expense_categories
(category_name, description)
VALUES
('Electronics', 'Electronic device and repair expenses');

INSERT INTO expense_subcategories
(subcategory_name, category_id)
VALUES
('Newspaper', 2),
('Mobile Repair', 18),
('Family Function', 15),
('Cleaning Service', 11),
('Vehicle EMI', 7);

INSERT INTO expenses
(expense_date, category_id, subcategory_id, amount, member_id, vendor_id, payment_method_id, description, recurring, status)
VALUES
('2026-04-01', 8, 24, 1500, 1, 21, 2, 'Travel ticket', FALSE, 'Paid'),
('2026-04-03', 1, 1, 15000, 3, 1, 1, 'Monthly Grocery', TRUE, 'Paid'),
('2026-04-04', 1, 2, 420, 2, 2, 1, 'Monthly Grocery', TRUE, 'Paid'),
('2026-04-07', 2, 49, 240, 1, 22, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-04-08', 3, 10, 10000, 1, 11, 5, 'Monthly Housing', TRUE, 'Paid'),
('2026-04-10', 2, 5, 2200, 3, 3, 2, 'Monthly Electricity Bill', TRUE, 'Pending'),
('2026-04-11', 3, 11, 500, 2, 12, 1, 'Monthly Housing', TRUE, 'Paid'),
('2026-04-12', 5, 15, 500, 5, 23, 1, 'Doctor Consultation', FALSE, 'Paid'),
('2026-04-14', 2, 8, 349, 3, 4, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-04-15', 2, 9, 849, 4, 8, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-04-17', 9, 28, 20000, 5, 24, 5, 'Admission Fees', FALSE, 'Partially Paid'),
('2026-04-19', 1, 3, 740, 2, 25, 1, 'Monthly Grocery', TRUE, 'Pending'),
('2026-04-20', 18, 50, 2500, 4, 26, 2, 'Mobile Repair', FALSE, 'Paid'),
('2026-04-21', 15, 49, 5000, 1, 27, 1, 'Family Function Expense', FALSE, 'Paid'),
('2026-04-22', 14, 41, 349, 5, 15, 2, 'Monthly Subscription', TRUE, 'Paid'),
('2026-04-24', 11, 51, 1249, 2, 28, 4, 'Cleaning service Expenses', FALSE, 'Paid'),
('2026-04-27', 7, 52, 12000, 4, 16, 5, 'Monthly Transportation', TRUE, 'Paid'),
('2026-04-28', 9, 30, 300, 6, 29, 1, 'Stationery expenses', FALSE, 'Paid'),
('2026-04-30', 2, 6, 560, 1, 9, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-04-30', 15, 44, 1200, 5, 27, 1, 'Birthday Gift', FALSE, 'Paid');

SELECT *
FROM expenses
ORDER BY expense_date;


DELETE FROM expenses
WHERE expense_id BETWEEN 20 AND 38;

SELECT *
FROM expenses
ORDER BY expense_date;

INSERT INTO expense_subcategories
(subcategory_name, category_id)
VALUES
('Tourism', 8),
('Pest Control', 11),
('Gas Stove Repair', 11),
('Kitchen Accessories', 11);

INSERT INTO vendors
(vendor_name)
VALUES
('Local Kirana Shop'),
('Local Clothing Store');

INSERT INTO expenses
(expense_date, category_id, subcategory_id, amount, member_id, vendor_id, payment_method_id, description, recurring, status)
VALUES
('2026-05-01', 15, 42, 350, 5, 30, 2, 'Haircut Charges', FALSE, 'Paid'),
('2026-05-02', 10, 32, 2000, 3, 31, 4, 'New footwear purchase', FALSE, 'Paid'),
('2026-05-04', 1, 1, 12999, 1, 39, 3, 'Monthly grocery', TRUE, 'Paid'),
('2026-05-05', 1, 3, 750, 1, 25, 2, 'Monthly grocery', TRUE, 'Paid'),
('2026-05-06', 2, 6, 420, 3, 9, 5, 'Monthly Utilities', TRUE, 'Pending'),
('2026-05-08', 2, 5, 1650, 2, 3, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-05-09', 2, 8, 349, 5, 4, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-05-11', 2, 9, 849, 3, 8, 2, 'Monthly Utilities', TRUE, 'Paid'),
('2026-05-11', 2, 49, 240, 2, 14, 1, 'Monthly Utilities', TRUE, 'Paid'),
('2026-05-13', 3, 11, 500, 4, 12, 5, 'Monthly Housing', TRUE, 'Paid'),
('2026-05-16', 3, 10, 10000, 1, 11, 2, 'Monthly Housing', TRUE, 'Paid'),
('2026-05-18', 14, 41, 349, 3, 15, 2, 'Monthly Subscription', TRUE, 'Paid'),
('2026-05-19', 11, 55, 1500, 1, 32, 1, 'Pest control service', FALSE, 'Paid'),
('2026-05-21', 11, 56, 900, 2, 33, 2, 'Gas stove repair charges', FALSE, 'Paid'),
('2026-05-23', 14, 18, 1200, 1, 34, 4, 'Family Dinner', FALSE, 'Paid'),
('2026-05-25', 8, 54, 3500, 1, 35, 2, 'Family Trip', FALSE, 'Paid'),
('2026-05-27', 7, 53, 12000, 1, 16, 5, 'Monthly Transportation', TRUE, 'Paid'),
('2026-05-29', 10, 31, 2700, 3, 40, 1, 'New Clothes Purchase', FALSE, 'Paid'),
('2026-05-30', 15, 42, 500, 3, 37, 2, 'Haircut and grooming', FALSE, 'Paid'),
('2026-05-31', 11, 57, 1100, 2, 38, 4, 'Kitchen accessories purchase', FALSE, 'Paid');

SELECT COUNT(*) AS total_records
FROM expenses;

-- 11. UPDATE --

-- Situation 1: Before UPDATE
SELECT *
FROM expenses
WHERE expense_id = 1;

-- Situation 1: Correct the wrong amount
UPDATE expenses
SET amount = 11500
WHERE expense_id = 1;

-- Situation 1: Correct the wrong amount
UPDATE expenses
SET amount = 11500
WHERE expense_id = 1;

-- Situation 1: After UPDATE
SELECT *
FROM expenses
WHERE expense_id = 1;

-- Situation 2: Before UPDATE
SELECT *
FROM expenses
WHERE expense_date = '2026-05-06';

-- Situation 2: Update payment status
UPDATE expenses
SET status = 'Paid'
WHERE expense_date = '2026-05-06';

-- Situation 2: After UPDATE
SELECT *
FROM expenses
WHERE expense_date = '2026-05-06';

-- Situation 3: Before UPDATE
SELECT *
FROM vendors
WHERE vendor_id = 39;

-- Situation 3: Correct vendor name
UPDATE vendors
SET vendor_name = 'Local Grocery Shop'
WHERE vendor_id = 39;

-- Situation 3: After UPDATE
SELECT *
FROM vendors
WHERE vendor_id = 39;


-- Situation 4: Before UPDATE
SELECT *
FROM expenses
WHERE expense_id = 19;

-- Situation 4: Correct recurring status
UPDATE expenses
SET recurring = TRUE
WHERE expense_id = 19;

-- Situation 4: After UPDATE
SELECT *
FROM expenses
WHERE expense_id = 19;

-- 12. DELETE --


-- Question 12, Situation 1: Identify duplicate transactions

SELECT expense_date, amount, description, COUNT(*) AS duplicate_count
FROM expenses
GROUP BY expense_date, amount, description
HAVING COUNT(*) > 1;

-- Question 12, Situation 1: Identify duplicate transaction

SELECT *
FROM expenses
WHERE expense_date = '2026-05-23'
  AND amount = 1200
  AND description = 'Family Dinner';

-- Question 12, Situation 1: Remove duplicate transaction

DELETE FROM expenses
WHERE expense_id = 113;

-- Situation 1: Verify duplicate was removed

SELECT *
FROM expenses
WHERE expense_date = '2026-05-23'
  AND amount = 1200
  AND description = 'Family Dinner';

-- Question 12, Situation 2: Insert a test transaction

INSERT INTO expenses
(expense_date, category_id, subcategory_id, amount, member_id, vendor_id, payment_method_id, description, recurring, status)
VALUES
('2026-06-01', 17, 47, 1, 1, 20, 1, 'TEST TRANSACTION', FALSE, 'Paid');

-- Question 12, Situation 2: Delete test transaction

DELETE FROM expenses
WHERE description = 'TEST TRANSACTION';

-- Situation 2: Verify test transaction was deleted

SELECT *
FROM expenses
WHERE description = 'TEST TRANSACTION';


-- Question 12, Situation 3: Find unused vendors

SELECT v.vendor_id, v.vendor_name
FROM vendors v
LEFT JOIN expenses e
ON v.vendor_id = e.vendor_id
WHERE e.vendor_id IS NULL;

-- Question 12, Situation 3: Remove incorrect unused vendor

DELETE FROM vendors
WHERE vendor_id = 20;

-- Situation 3: Verify vendor was deleted

SELECT *
FROM vendors
WHERE vendor_id = 20;

-- 13. ALTER --
-- Question 13, Requirement 1:
-- Add column to identify Essential or Non-Essential expenses

ALTER TABLE expenses
ADD COLUMN expense_type VARCHAR(20);

-- Requirement 2:
-- Add column to record expense location

ALTER TABLE expenses
ADD COLUMN location VARCHAR(100);

-- Requirement 3:
-- Add contact information for vendors

ALTER TABLE vendors
ADD COLUMN contact_info VARCHAR(100);

-- Question 13, Requirement 3:
-- Check whether contact information column exists

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'vendors'
AND column_name = 'contact_info';

-- Question 13, Requirement 2:
-- Add location information for expenses

ALTER TABLE expenses
ADD COLUMN location VARCHAR(100);

-- Question 13, Requirement 2:
-- Check whether location column exists

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'expenses'
AND column_name = 'location';

-- 14. DROP --
-- Question 14:
-- Create a temporary test table for testing purposes

CREATE TABLE test_expenses (
    test_id SERIAL PRIMARY KEY,
    description VARCHAR(100),
    amount NUMERIC(10,2)
);


-- Insert sample data into the test table

INSERT INTO test_expenses
(description, amount)
VALUES
('Test Grocery Expense', 500),
('Test Electricity Expense', 1200);

-- Verify the test data before dropping the table
SELECT *
FROM test_expenses;

-- Remove the test table after testing
DROP TABLE test_expenses;


-- A. Overall Spending --
-- Question 1: What is the total household expenditure during the three months?
SELECT SUM(amount) AS total_expenditure
FROM expenses;


-- Question 2: What is the average expense per transaction?
SELECT AVG(amount) AS average_expense_per_transaction
FROM expenses;


-- Question 3: What is the highest individual expense?
SELECT MAX(amount) AS highest_expense
FROM expenses;


-- Question 4: What is the lowest individual expense?
SELECT MIN(amount) AS lowest_expense
FROM expenses;


-- Question 5: How many expense transactions were recorded?
SELECT COUNT(*) AS total_transactions
FROM expenses;

--  B. Month-wise Analysis --
-- Question 6: Which month had the highest total expenditure?

SELECT
    TO_CHAR(expense_date, 'Month') AS month,
    SUM(amount) AS total_expenditure
FROM expenses
GROUP BY TO_CHAR(expense_date, 'Month'), EXTRACT(MONTH FROM expense_date)
ORDER BY total_expenditure DESC;


-- Question 7: Which month had the lowest total expenditure?

SELECT
    TO_CHAR(expense_date, 'Month') AS month,
    SUM(amount) AS total_expenditure
FROM expenses
GROUP BY TO_CHAR(expense_date, 'Month'), EXTRACT(MONTH FROM expense_date)
ORDER BY total_expenditure ASC;

-- Question 8: Did household expenditure increase or decrease from the first month to the third month?

SELECT
    SUM(CASE
        WHEN EXTRACT(MONTH FROM expense_date) = 3 THEN amount
        ELSE 0
    END) AS march_total,

    SUM(CASE
        WHEN EXTRACT(MONTH FROM expense_date) = 5 THEN amount
        ELSE 0
    END) AS may_total,

    SUM(CASE
        WHEN EXTRACT(MONTH FROM expense_date) = 5 THEN amount
        ELSE 0
    END)
    -
    SUM(CASE
        WHEN EXTRACT(MONTH FROM expense_date) = 3 THEN amount
        ELSE 0
    END) AS change_from_march_to_may
FROM expenses;

-- Question 9: Which month had the highest number of transactions?

SELECT
    TO_CHAR(expense_date, 'Month') AS month,
    COUNT(*) AS total_transactions
FROM expenses
GROUP BY TO_CHAR(expense_date, 'Month'), EXTRACT(MONTH FROM expense_date)
ORDER BY total_transactions DESC;

-- Question 10: Identify any significant change in spending between the three months.

SELECT
    TO_CHAR(expense_date, 'Month') AS month,
    SUM(amount) AS total_expenditure,
    COUNT(*) AS total_transactions,
    AVG(amount) AS average_expense
FROM expenses
GROUP BY TO_CHAR(expense_date, 'Month'), EXTRACT(MONTH FROM expense_date)
ORDER BY EXTRACT(MONTH FROM expense_date);

-- C. Expense Pattern Analysis --

-- Question 11: What are the major types of expenses in the household?

SELECT
    c.category_name AS expense_type,
    SUM(e.amount) AS total_amount
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_amount DESC;

-- Question 12: Which expense type consumed the largest amount?

SELECT
    c.category_name AS expense_type,
    SUM(e.amount) AS total_amount
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_amount DESC
LIMIT 1;


-- Question 13: Which expense type occurred most frequently?

SELECT
    c.category_name AS expense_type,
    COUNT(*) AS transaction_count
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
GROUP BY c.category_name
ORDER BY transaction_count DESC
LIMIT 1;


-- Question 14: Identify the top three areas where the household spends the most.

SELECT
    c.category_name AS expense_type,
    SUM(e.amount) AS total_amount
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_amount DESC
LIMIT 3;

-- Question 15: Identify expenses that occur frequently but involve relatively small amounts.

SELECT
    c.category_name AS expense_type,
    COUNT(*) AS transaction_count,
    SUM(e.amount) AS total_amount,
    AVG(e.amount) AS average_amount
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
GROUP BY c.category_name
HAVING COUNT(*) >= 3
ORDER BY average_amount ASC, transaction_count DESC;



-- D. Recurring Expense Analysis --
-- Question 16: Identify the household's recurring expenses

SELECT
    e.expense_id,
    e.expense_date,
    c.category_name AS expense_type,
    e.amount,
    e.description
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
WHERE e.recurring = TRUE
ORDER BY e.amount DESC;


-- Question 17: How much money is spent on recurring expenses during the three months?

SELECT
    SUM(amount) AS total_recurring_expenses
FROM expenses
WHERE recurring = TRUE;

-- Question 18: Which recurring expenses should the family review?

SELECT
    e.expense_id,
    c.category_name AS expense_type,
    e.description,
    e.amount
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
WHERE e.recurring = TRUE
ORDER BY e.amount DESC;

-- Question 19: Identify recurring expenses whose amounts are relatively high

SELECT
    e.expense_id,
    c.category_name AS expense_type,
    e.description,
    e.amount
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
WHERE e.recurring = TRUE
AND e.amount >= 3000
ORDER BY e.amount DESC;


-- E. Payment Behaviour --
-- Question 20: Which payment method is used most frequently?

-- Question 20: Which payment method is used most frequently?

SELECT
    p.method_name,
    COUNT(*) AS transaction_count
FROM expenses e
JOIN payment_methods p
    ON e.payment_method_id = p.payment_method_id
GROUP BY p.method_name
ORDER BY transaction_count DESC
LIMIT 1;


-- Question 21: Which payment method accounts for the largest amount of expenditure?

SELECT
    p.method_name,
    SUM(e.amount) AS total_expenditure
FROM expenses e
JOIN payment_methods p
    ON e.payment_method_id = p.payment_method_id
GROUP BY p.method_name
ORDER BY total_expenditure DESC
LIMIT 1;


-- Question 22: How much is spent through cash?

SELECT
    SUM(e.amount) AS total_cash_expenditure
FROM expenses e
JOIN payment_methods p
    ON e.payment_method_id = p.payment_method_id
WHERE p.method_name = 'Cash';


-- Question 23: How much is spent through digital payment methods?

SELECT
    SUM(e.amount) AS total_digital_expenditure
FROM expenses e
JOIN payment_methods p
    ON e.payment_method_id = p.payment_method_id
WHERE p.method_name IN
      ('UPI', 'Debit Card', 'Credit Card', 'Net Banking');

-- Question 24: Identify high-value transactions made through digital payment methods.

SELECT
    e.expense_id,
    e.expense_date,
    p.method_name,
    e.amount,
    e.description
FROM expenses e
JOIN payment_methods p
    ON e.payment_method_id = p.payment_method_id
WHERE p.method_name IN
      ('UPI', 'Debit Card', 'Credit Card', 'Net Banking')
AND e.amount >= 10000
ORDER BY e.amount DESC;


-- Question 25: Identify expenses above a threshold that you consider significant for your household.

SELECT
    e.expense_id,
    e.expense_date,
    c.category_name AS expense_type,
    e.amount,
    e.description
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
WHERE e.amount >= 10000
ORDER BY e.amount DESC;

-- Question 26: Identify unusually high expenses.

SELECT
    e.expense_id,
    e.expense_date,
    c.category_name AS expense_type,
    e.amount,
    e.description
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
WHERE e.amount >= 20000
ORDER BY e.amount DESC;

-- Question 27: Identify expenses that occurred only once but had a significant financial impact.

SELECT
    e.expense_id,
    e.expense_date,
    c.category_name AS expense_type,
    e.amount,
    e.description
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
WHERE e.amount >= 10000
AND e.description IN (
    SELECT description
    FROM expenses
    GROUP BY description
    HAVING COUNT(*) = 1
)
ORDER BY e.amount DESC;


-- Question 28: Investigate the reason for at least three significant/high-value expenses.

SELECT
    e.expense_id,
    e.expense_date,
    c.category_name AS expense_type,
    e.amount,
    e.description,
    e.status,
    e.recurring
FROM expenses e
JOIN expense_categories c
    ON e.category_id = c.category_id
WHERE e.amount >= 10000
ORDER BY e.amount DESC
LIMIT 3;

-- ...............................................................................--
