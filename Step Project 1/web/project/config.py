import os

basedir = os.path.abspath(os.path.dirname(__file__))

# writing down all the configs
class Config(object):
    SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL", "sqlite://")
    SQLALCHEMY_TRACK_MODIFICATIONS = False