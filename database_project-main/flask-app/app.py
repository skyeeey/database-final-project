###
# Main application interface
###
from flask import Flask, jsonify
from flask import request
from flaskext.mysql import MySQL

# import the create app function
# that lives in src/__init__.py
from src import create_app

# create the app object
# app = create_app()
app = Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'db'
app.config['MYSQL_DATABASE_PORT'] = 3200
app.config['MYSQL_DATABASE_USER'] = 'webapp'
app.config['MYSQL_DATABASE_PASSWORD'] = 'abc123'
app.config['MYSQL_DATABASE_DB'] = 'database_project'

db_connection = MySQL()
db_connection.init_app(app)

# import the blueprint objects from their respective locations
from managers_api.managers import managers_blueprint
from users_api.users import users_blueprint

# register the blueprints we created with the current Flask app object.
app.register_blueprint(managers_blueprint, url_prefix='/cust')
app.register_blueprint(users_blueprint, url_prefix='/mgr')

if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading)
    # this app will be bound to port 4000.
    # Take a look at the docker-compose.yml to see
    # what port this might be mapped to...
    app.run(debug = True, host = '0.0.0.0', port = 4000)

# create new object
@app.route('/test_db')
def testing_the_database():
    # cursor temporary storage of exectuing result of query
    cur = db_conn.get_db().cursor()
    cur.execute('select * from products')
    # get first element, col headers
    col_headers = [x[0] for x in cur.description]
    # create empty list/container for data
    json_data = []
    # get all data from cursor
    the_data = cur.fetchall()
    #iterate through each row of dataset
    for row in the_data:
        # zip together column headers and row
        # col header & data value to create dictionary
        # and add to datatable
        json_data.append(dict(zip(col_headers,row)))
    return jsonify(json_data)


# route in application that accepts parameter
@app.route('/h/<userName>')
def greetings_with_name(userName):
    return f'<h1>Hello, {userName}!</h1>'

# 127.0.0.1:3200/greetings
@app.route('/greetings')
def greetings():
    return '<h1>Hello!<h1>'

@app.route('/formReview')
def get_form():
    return """
        <h2>Post your Review</h2>

        <form action="/form" method="POST">
        <label for="first">First name:</label><br>
        <input type="text" id="first" name="first" value="John"><br>
        <label for="last">Last name:</label><br>
        <input type="text" id="last" name="last" value="Doe"><br><br>
        <input type="submit" value="Submit">
        </form>
    """

# handles data sent back when user hits submit button
@app.route('/form', methods=['POST'])
def post_form():
    first_name = request.form['first']
    last_name = request.form['last']

    return f'<h2>Thank you for submitting your review, {first_name}</h2>'
    # '<h2>Got form data back via post request</h2>'





