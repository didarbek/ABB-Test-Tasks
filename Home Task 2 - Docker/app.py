# Importing all the needed stuff from flask
import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy


# Specifying Flask application
app = Flask(__name__)


# Specifying SQLALCHEMY
# NOTE
# Here we have to define environment variable DATABASE_URL
# We will do it in docker-compose.yml file
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL')
db = SQLAlchemy(app)


# Creating User model with all needed fields (id, first_name, last_name)
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String(50), nullable=False)
    last_name = db.Column(db.String(50), nullable=False)

    # Initializing User model
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

# Creating model
db.create_all()

# Creating an endpoint to get our user data by id
@app.route('/user/<int:id>', methods=['GET'])
def get_user(id):
    user = User.query.get(id)
    return jsonify(user.__dict__)


if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)