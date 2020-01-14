from Server import db


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(64), nullable=False)
    routes = db.relationship('Routes', backref='author', lazy=True)

    def __repr__(self):
        return f'User {self.id}: ({self.username}, {self.email})'


class Routes(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    end_lat = db.Column(db.Float(), nullable=False)
    end_lon = db.Column(db.Float(), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

    def __repr__(self):
        return f'Route {self.id}: ({self.user_id}, end_lat: {self.end_lat}, end_lon: {self.end_lon})'

