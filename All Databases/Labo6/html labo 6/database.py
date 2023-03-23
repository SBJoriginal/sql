import pymysql

connection = pymysql.connect(
    host="localhost",
    user="root",
    password="lennyplante5@Sql.com",
    db="glo_2005_webapp_2023",
    autocommit=True

)

cursor = connection.cursor()


def insert_todo(text):
    requests = f"""INSERT INTO todo(text) VALUE ("{text}")"""

    cursor.execute(requests)

if __name__ == '__main__':
    insert_todo("From backend")