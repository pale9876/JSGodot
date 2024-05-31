const top_table = document.getElementById("top-table");
/*
<div class="container-fluid">
    <a href="#" class="navbar-brand">Godot-Web</a>
    <div class="btn-group dropstart" role="group">
        <button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Docs</button>
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
    </div>
</div>
*/

set_top_table();

function set_top_table() {
   
    var ddMenu = document.createElement("ul")
    ddMenu.className = "dropdown-menu"
    ddMenu.id = "ddmenu"

    btnGroup.append(ddMenu)

    var dditemStr = "dropdown-item"
    var dividerStr = "dropdown-divider"

    var li_1 = document.createElement("li")
    var a_1 = document.createElement("a")
    li_1.append(a_1)
    a_1.className = "dropdown-item"
    a_1.href = "/installation/index.html"
    a_1.innerHTML = "Install Godot"
    ddMenu.append(li_1)

    var li_2 = document.createElement("li")
    var a_2 = document.createElement("a")
    create_li(li_2, a_2, dditemStr, "/setEnv/index.html",'Set Environment')
    ddMenu.append(li_2)
    
    var divide_li = document.createElement("li")
    var hr = document.createElement("hr")
    hr.className = "dropdown-divider"
    divide_li.append(hr)
    ddMenu.append(divide_li)

    var li_3 = document.createElement("li")
    var a_3 = document.createElement('a')
    create_li(li_3, a_2, dditemStr, "/godotToWeb/index.html", 'GodotToWeb')

    var li_4 = document.createElement("li")
    var a_4 = document.createElement('a')

    var li_5 = document.createElement("li")
    var a_5 = document.createElement('a')

    var li_6 = document.createElement("li")
    var a_6 = document.createElement('a')

    var li_7 = document.createElement("li")
    var a_7 = document.createElement('a')

    var li_8 = document.createElement("li")
    var a_8 = document.createElement('a')

    var li_9 = document.createElement("li")
    var a_9 = document.createElement('a')

}

function create_li(li, a, className, ref, listName){
    li.append(a)
    a.className = className
    a.href = ref
    a.innerHTML = listName
}