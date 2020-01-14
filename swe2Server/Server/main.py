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
        return {"username": user.username, "token": hashlib.sha256(bytes(user.username+user.password+salt, "utf-8")).hexdigest()}

    return "invalid Email or Password"


@app.route('/routes', methods=['POST', 'GET'])
def routes():
    r = request.get_json()
    user = models.User.query.filter_by(username=r["username"]).first()
    print(user)
    print(user.routes)
    #if user and hashlib.sha256(bytes(user.username+user.password+salt)).hexdigest() == r["token"]:
        #return jsonify(routes=user.routes)
        #pass
    print({"routes": [{"id": i.id, "lat": i.end_lat, "lon": i.end_lon} for i in user.routes]})
    return {"routes": [{"id": i.id, "lat": i.end_lat, "lon": i.end_lon} for i in user.routes]}


if __name__ == '__main__':
    app.run(debug=True)
