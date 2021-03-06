from flask import Flask, render_template, json, request
from flask_mysqldb import MySQL


app = Flask(__name__)
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456qwe'
app.config['MYSQL_DB'] = 'mydb'
app.config['MYSQL_HOST'] = 'test-app-mysql'
mysql.init_app(app)


def get_data():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * from messages where id > 0''')
    rv = cur.fetchall()
    return rv


@app.route('/', methods=['GET', 'POST'])
def main():
    conn = mysql.connection
    cursor = conn.cursor()
    # read the posted values from the UI
    if request.method == 'POST':
        _name = request.form['inputName']
        _message = request.form['inputMessage']
        query = "INSERT INTO messages (name, message) VALUES ('%s', '%s')" % (
            _name, _message)
        cursor.execute(query)
        conn.commit()
    else:
        query = "CREATE TABLE if not exists messages (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name  VARCHAR(40), message VARCHAR(500))"
        cursor.execute(query)
        conn.commit()
        messages = get_data()
        if len(messages) == 0:
            query = "INSERT INTO messages (name, message) VALUES ('Admin',  'Welcome onboard!')"
            cursor.execute(query)
            conn.commit()

    messages = get_data()
    return render_template('index.html', messages=messages)
