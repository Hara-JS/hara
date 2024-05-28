import pymysql
conn = pymysql.connect(host='127.0.0.1', user='root', password='oracle', db='haraDB', charset='utf8')
cur = conn.cursor()
cur.execute("CREATE TABLE userTable (id char(10), userName char(15), email char(20), birthYear int)")
conn.commit()
conn.close()
