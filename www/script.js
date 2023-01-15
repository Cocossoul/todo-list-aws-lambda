var todoList = null;
var taskInput = null;

document.addEventListener('DOMContentLoaded', onLoad, false);

function onLoad() {
    todoList = document.getElementById("todo-list");
    taskInput = document.getElementById("taskInput");
    // Call backend and display elements on todo-list
}

function newTask() {
    var newTaskElem = document.createElement("li");
    var taskNameElem = document.createTextNode(taskInput.value);
    newTaskElem.appendChild(taskNameElem);

    if (taskInput.value === '') {
        alert("You must write something!");
    } else {
        todoList.appendChild(newTaskElem);
        // Send task to backend
    }
    taskInput.value = "";
}
