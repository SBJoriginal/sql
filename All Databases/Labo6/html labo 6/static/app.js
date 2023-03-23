function displayNewTodo(todoText) {
    var todosContainer = document.getElementById("todos-container")

    var newTodoElement = document.createElement("div")

    newTodoElement.innerText = todoText

    todosContainer.appendChild(newTodoElement)
}


function onButtonClick() {
    var inputElement = document.getElementById("todo-input")

    var newTodoText = inputElement.value

    displayNewTodo(newTodoText)
}

function postTodo(todoText) {
    var url = "add-todo"

    fetch(url, {
        method: "POST",
        headers: {
            "Content-Type:": "application/json"
        },
        body: JSON.stringify({
            text: todoText
        })
        })
}