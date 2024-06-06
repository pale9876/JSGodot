const btnGroup = document.getElementById("btn-group")
const ddMenu = document.createElement("ul")

set_nav_table();

function set_nav_table() {

    ddMenu.className = "dropdown-menu"
    ddMenu.id = "ddmenu"
    
    btnGroup.append(ddMenu)
    
    var dditemStr = "dropdown-item"

    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/installation", "Install Godot")
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/setEnv", "Set Environment")
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/simpleTutorial", "Godot Simple Tutorial")
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/makeTemplate", "Make Html5 Template")
    create_divider()
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/godotToWeb/godotToWeb.html", "GodotToWeb")
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/godotToWeb/", "Example - 1")
    create_divider()
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/webToGodot/webToGodot.html", "WebToGodot")
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/webToGodot/", "Example - 2")
    create_divider()
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/debug", "Debugging")
    create_li("dropdown-item", "https://godot-javascript-web.netlify.app/autoLoad", "Use AutoLoad")
}

function create_li(c_name, ref, listName) {
    var li = document.createElement("li")
    var a = document.createElement("a")
    li.append(a)
    a.className = c_name
    a.href = ref
    a.innerHTML = listName
    ddMenu.append(li)
}
function create_divider() {
    var divide_li = document.createElement("li")
    var hr = document.createElement("hr")
    hr.className = "dropdown-divider"
    divide_li.append(hr)
    ddMenu.append(divide_li)
}