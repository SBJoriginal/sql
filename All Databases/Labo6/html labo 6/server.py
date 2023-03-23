from flask import Flask, render_template, request, jsonify
from database import insert_todo

app = Flask(__name__)

@app.route("/")
def index():
        return render_template("Labo 6.html")


@app.route ("/add-todo/")
def add_todo():
    data = request.json

    todo_text = data["text"]

    insert_todo(todo_text)

    response = {
        "status": 200
    }

    return jsonify(response)

if __name__ == '__main__':
    app.run()