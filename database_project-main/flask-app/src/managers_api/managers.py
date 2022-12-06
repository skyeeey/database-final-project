#import managers.py

from flask import Blueprint

# Create a new blueprint for managers
managers_blueprint = Blueprint('managers_blueprint', __name__)

# add a route to this blueprint
@managers_blueprint.route('/managers')
def get_all_managers():
    return f'<h1>Getting all the managers.</h1>'