const btnGroup = document.getElementById("btn-group")
const ddMenu = document.createElement("ul")

set_nav_table();

function set_nav_table() {

    ddMenu.className = "dropdown-menu"
    ddMenu.id = "ddmenu"
    
    btnGroup.append(ddMenu)
    
    var dditemStr = "dropdown-item"
    
    create_li("dropdown-item", "godot-javascript-web.netlify.app/", "Install Godot")
    create_li("dropdown-item", "godot-javascript-web.netlify.app/setEnv", "Set Environment")
    create_divider()
    create_li("dropdown-item", "godot-javascript-web.netlify.app/godotToWeb", "GodotToWeb")
    create_li("dropdown-item", "godot-javascript-web.netlify.app/#", "Example - 1")
    create_divider()
    create_li("dropdown-item", "godot-javascript-web.netlify.app/webToGodot", "WebToGodot")
    create_li("dropdown-item", "#", "Example - 2")
    create_divider()
    create_li("dropdown-item", "godot-javascript-web.netlify.app/Debug", "Debugging")
    create_li("dropdown-item", "godot-javascript-web.netlify.app/autoLoad", "Using GlobalSignal")
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

/* !!!!Preview HTML Code(미리보기)!!!!
                <ul class="dropdown-menu " id="ddmenu">
                    <li><a class="dropdown-item" href="/installation/index.html">Install Godot</a></li>
                    <li><a class="dropdown-item" href="/setEnv/index.html">Set Environment</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/godotToJs/index.html">GodotToWeb</a></li>
                    <li><a class="dropdown-item" href="#">Example - 1</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/webToGodot/index.html">WebToGodot</a></li>
                    <li><a class="dropdown-item" href="#">Example - 2</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/Debug/index.html">Debugging</a></li>
                    <li><a class="dropdown-item" href="/Debug/index.html">AutoLoad</a></li>
                    <li><a class="dropdown-item" href="/Debug/index.html">Using Signal</a></li>
                </ul>
*/