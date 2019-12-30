from flask import escape, request, jsonify
from Server import app, db, models
import hashlib


salt = "12345"


@app.route('/')
def home():

    return "Just used to log in"


@app.route('/login', methods=['POST', 'GET'])
def login():
    r = request.get_json()

    user = models.User.query.filter_by(email=r["email"]).first()
    if user and user.password == r["password"]:
        return jsonify(username=user.username, token=hashlib.sha256(bytes(user.username+user.password+salt, "utf-8")).hexdigest())

    return "invalid Email or Password"


if __name__ == '__main__':
    app.run(debug=True)
