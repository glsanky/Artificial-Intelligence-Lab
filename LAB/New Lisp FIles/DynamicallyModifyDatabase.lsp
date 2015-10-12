(set 'elements
;No  Atomic-Weight Name Symbol MP BP  Density EarthCrust% DiscoveryYear Group IonizationEnergy (eV)
[text]1	1.0079	Hydrogen	H	-259	-253	0.09	0.14	1776	1	13.5984
2	4.0026	Helium	He	-272	-269	0	0	1895	18	24.5874
3	6.941	Lithium	Li	180	1347	0.53	0	1817	1	5.3917
4	9.0122	Beryllium	Be	1278	2970	1.85	0	1797	2	9.3227[/text])
(module "sqlite3.lsp")

(change-dir "/tmp")

; open or create a database
(if (sql3:open "periodic_table.db") 
		(println "database opened/created")
		(println "problem: " (sql3:error)))

(set 'column-def "number INTEGER, atomic_weight FLOAT, element TEXT, symbol TEXT, mp FLOAT, bp FLOAT, density FLOAT, earth_crust FLOAT, discovered INTEGER, egroup INTEGER, ionization FLOAT")

(define (create-table)
;;; create a table called t1
(println (string "create table t1 (" column-def ");"))
(if (sql3:sql (string "create table t1 (" column-def ")"))
		(println "created table  ... Ok")
		(println "problem " (sql3:error))))

(define (init-table)
;;; fill the table with data
	(dolist (e (parse elements "\n" 0))
	(set 'line (parse e))
	(if (sql3:sql 
		(format "insert into t1 values ('%d','%f','%s','%s','%f','%f','%f','%f', '%d', '%d', '%f');" 
		(int (line 0))
		(float (line 1))
		(line 2) 
		(line 3) 
		(float (line 4)) 
		(float (line 5))
		(float (line 6))
		(float (line 7))
		(int (line 8))
		(int (line 9))
		(float (line 10))))
		; success
		(println "inserted element " e )
		; failure
		(println (sql3:error) ":" "problem inserting " e))))

; if there's not "t1" table, create one and fill it
(unless (find "t1" (sql3:tables))
	(and
		(create-table)
		(init-table)))

(pretty-print 80)

(define (query sql-text)
	; run a query
	(set 'sqlarray (sql3:sql sql-text))
	(if sqlarray
		(begin
			(println "\n\nquery: " sql-text)
			(println "")
			(map println sqlarray))
		(println (sql3:error) " problem with select")))

(query "select symbol, element, discovered  from t1 where egroup = 18") ; the noble gases
(query "select element from t1  where earth_crust = 0.0")
(query "select * from t1  order by discovered")
(query "select element,earth_crust, discovered from t1 where discovered < 1900 and earth_crust > 2 order by discovered")
(query "select element,symbol,atomic_weight from t1  where symbol like 'A%' order by element")
(query "select * from t1  where mp > 3000") 
(query "select * from t1  where bp < mp ")
(query "select * from t1  order by random() limit 10 ")
(query "select element,atomic_weight from t1 where element like '%en' order by random() limit 30")
(query "select * from t1 order by symbol  limit 1 offset 2")
(query "select element,bp from t1 where bp > 5000 order by bp")
(query "select * from t1  where element like '%en' and bp > 10")
(query "select * from t1  where element like '%en'")
(query "select * from t1  where element like '%ium'")