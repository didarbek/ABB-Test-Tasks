from flask.cli import FlaskGroup

from project import app, db


cli = FlaskGroup(app)


# creating command to create a database
@cli.command("create_db")
def create_db():
    db.drop_all()
    db.create_all()
    db.session.commit()


if __name__ == "__main__":
    cli()