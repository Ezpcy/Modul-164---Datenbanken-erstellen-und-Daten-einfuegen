--@block
use humanresources;

/* Schreiben Sie eine Abfrage, um die employee-ID, den Namen (first_name, last_name) und das Gehalt in aufsteigender Reihenfolge des Gehalts zu erhalten. */
--@block
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
    employees
ORDER BY
    SALARY ASC;

/* Schreiben Sie eine Abfrage, um das maximale und minimale Gehalt aus der Mitarbeiter Tabelle zu erhalten. */
--@block
SELECT
    MAX(SALARY) AS MAX_SALARY,
    MIN(SALARY) AS MIN_SALARY
FROM
    employees;

/* Schreiben Sie eine Abfrage, um die Anzahl der Mitarbeiter zu erhalten, die für das Unternehmen arbeiten */
--@block
SELECT
    COUNT(EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES
FROM
    employees;

/* Schreiben Sie eine Abfrage, die im Nachnamen von Mitarbeitern mit „R“ anfängt und mit „s“ endet. */
--@block
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME
FROM
    employees
WHERE
    LAST_NAME LIKE 'R%s';

/* Listen Sie Namen auf, welche zurzeit keine Anstellung haben. */
--@block
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME
FROM
    employees
WHERE
    MANAGER_ID IS NULL;

/* Schreiben Sie eine Abfrage, um die Namen (first_name, last_name) und das Gehalt aller Mitarbeiter anzuzeigen, deren Gehalt nicht zwischen 10.000 und 15.000 US-Dollar liegt. */
--@block
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
    employees
WHERE
    SALARY NOT BETWEEN 10000 AND 15000;

/* Schreiben Sie eine Abfrage, um den Namen (first_name, last_name) und die department-ID aller Mitarbeiter in den Abteilungen 30 oder 100 in aufsteigender Reihenfolge anzuzeigen. */
--@block
SELECT
    FIRST_NAME,
    LAST_NAME,
    DEPARTMENT_ID
FROM
    employees
WHERE
    DEPARTMENT_ID IN (30, 100)
ORDER BY
    DEPARTMENT_ID ASC;

/* Schreiben Sie eine Abfrage, um den Namen (first_name, last_name) und das Gehalt aller Mitarbeiter anzuzeigen, deren Gehalt nicht zwischen 10.000 und 15.000 US-Dollar liegt und die in Abteilung 30 oder 100 sind. */
--@block
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY
FROM
    employees
WHERE
    SALARY NOT BETWEEN 10000 AND 15000
    AND DEPARTMENT_ID IN (30, 100);

/* Schreiben Sie eine Abfrage, um den Namen (first_name, last_name) und das Einstellungsdatum für alle Mitarbeiter anzuzeigen, die 1987 eingestellt wurden. */
--@block
SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
FROM
    employees
WHERE
    YEAR(HIRE_DATE) = 1987;

/* Schreiben Sie eine Abfrage, um den Vornamen aller Mitarbeiter anzuzeigen, die sowohl "b" als auch "c" in ihrem Vornamen haben. */
--@block
SELECT
    FIRST_NAME
FROM
    employees
WHERE
    FIRST_NAME LIKE '%b%'
    AND FIRST_NAME LIKE '%c%';

/* Schreiben Sie eine Abfrage, um den Nachnamen, den Job und das Gehalt aller Mitarbeiter anzuzeigen, deren Job der eines Programmierers oder eines Versandmitarbeiters ist und deren Gehalt nicht 4.500 $, 10.000 $ oder 15.000 $ entspricht. */
--@block
SELECT
    LAST_NAME,
    JOB_ID,
    SALARY
FROM
    employees
WHERE
    JOB_ID IN ('IT_PROG', 'SH_CLERK')
    AND SALARY NOT IN (4500, 10000, 15000);

/* Schreiben Sie eine Abfrage, die im Nachnamen von Mitarbeitern „e“ als drittes Zeichen enthält. */
--@block
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME
FROM
    employees
WHERE
    LAST_NAME LIKE '__e%';

/* Schreiben Sie eine Abfrage, um die verfügbaren Stellen/Bezeichnungen (jobs/designations) in der Mitarbeitertabelle anzuzeigen. */
--@block
SELECT
    DISTINCT JOB_ID
FROM
    employees;

/* Schreiben Sie eine Abfrage, um den Namen (Vorname, Nachname), das Gehalt und die Gewinnbeteiligung (15 % des Gehalts) aller Mitarbeiter anzuzeigen. */
--@block
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    SALARY * 0.15 AS COMMISSION
FROM
    employees;

/* Schreiben Sie eine Abfrage, um alle Datensätze von Mitarbeitern auszuwählen, deren Nachnamen „JONES“, „BLAKE“, „SCOTT“, „KING“ und „FORD“ sind. */
--@block
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME
FROM
    employees
WHERE
    LAST_NAME IN ('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD');

/* Schreiben Sie eine Abfrage, um den Namen (Vorname, Nachname), die Stelle, die Abteilungs-ID und den Namen der Mitarbeiter zu finden, die in London arbeiten. */
--@block
SELECT
    e.FIRST_NAME,
    e.LAST_NAME,
    e.JOB_ID,
    e.DEPARTMENT_ID,
    d.DEPARTMENT_NAME
FROM
    employees e
    JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
    d.LOCATION_ID = 1400;

/* Schreiben Sie eine Abfrage, um die Mitarbeiter-ID, den Namen (Nachname) zusammen mit der Manager-ID und dem Namen (Nachname) zu finden. */
--@block
SELECT
    e.EMPLOYEE_ID,
    e.LAST_NAME,
    e.MANAGER_ID,
    m.LAST_NAME AS MANAGER_NAME
FROM
    employees e
    LEFT JOIN employees m ON e.MANAGER_ID = m.EMPLOYEE_ID;

/* Schreiben Sie eine Abfrage, um den Namen (Vorname, Nachname) und das Einstellungsdatum der Mitarbeiter zu finden, die nach „Jones“ eingestellt wurden. */
--@block
SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
FROM
    employees
WHERE
    HIRE_DATE > (SELECT HIRE_DATE FROM employees WHERE LAST_NAME = 'Jones');

/* Schreiben Sie eine Abfrage, um die Mitarbeiter-ID, die Berufsbezeichnung, die Anzahl der Tage zwischen dem Enddatum und dem Startdatum für alle Jobs in Abteilung 90 aus dem Jobverlauf zu finden. */
--@block
SELECT
    EMPLOYEE_ID,
    JOB_ID,
    DATEDIFF(END_DATE, START_DATE) AS DAYS
FROM
    job_history
WHERE
    DEPARTMENT_ID = 90;

/* Schreiben Sie eine Abfrage, um die Abteilungs-ID und den Namen und Vornamen des Managers anzuzeigen. */
--@block
SELECT
    d.DEPARTMENT_ID,
    e.FIRST_NAME,
    e.LAST_NAME
FROM
    departments d
    JOIN employees e ON d.MANAGER_ID = e.EMPLOYEE_ID;

/* Schreiben Sie eine Abfrage, um den Abteilungsnamen, den Managernamen und die Stadt anzuzeigen. */
--@block
SELECT
    d.DEPARTMENT_NAME,
    e.FIRST_NAME,
    e.LAST_NAME,
    l.CITY
FROM
    departments d
    JOIN employees e ON d.MANAGER_ID = e.EMPLOYEE_ID
    JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID;

/* Schreiben Sie eine Abfrage, um die Berufsbezeichnung und das Durchschnittsgehalt der Mitarbeiter anzuzeigen. */
--@block
SELECT
    JOB_ID,
    ROUND(AVG(SALARY) , 2) AS AVG_SALARY
FROM
    employees
GROUP BY
    JOB_ID;

/* Schreiben Sie eine Abfrage, um die Berufsbezeichnung, den Namen des Mitarbeiters und die Differenz zwischen dem Gehalt des Mitarbeiters und dem Mindestgehalt für den Job anzuzeigen. */
--@block
SELECT
    JOB_ID,
    FIRST_NAME,
    LAST_NAME,
    SALARY - (SELECT MIN_SALARY FROM jobs WHERE JOB_ID = employees.JOB_ID) AS SALARY_DIFF
FROM
    employees;

/* Schreiben Sie eine Abfrage, um den job history anzuzeigen. Zwar von einem Mitarbeiter, der derzeit mehr als 10000 Gehalt bezieht. */
--@block
SELECT
    j.*
FROM
    job_history j
    JOIN employees e ON j.EMPLOYEE_ID = e.EMPLOYEE_ID
WHERE
    e.SALARY > 10000;

/* Schreiben Sie eine Abfrage, um den Vornamen, den Nachnamen, das Einstellungsdatum und das Gehalt des Managers für alle Manager anzuzeigen, deren Erfahrung mehr als 15 Jahre beträgt. */
--@block
SELECT
    e.FIRST_NAME,
    e.LAST_NAME,
    e.HIRE_DATE,
    e.SALARY
FROM
    employees e
WHERE
    e.EMPLOYEE_ID IN (
        SELECT
            MANAGER_ID
        FROM
            employees
        WHERE
            DATEDIFF(CURDATE(), HIRE_DATE) > 15 * 365
    );