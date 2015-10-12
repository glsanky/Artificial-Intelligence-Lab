(set 'xml
"<person name='John Doe' tel='555-1212'><person1 name='somename' >Hey! I am nested</person1></person>")

(xml-parse xml)