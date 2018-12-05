(function() {

  function buildHiddenInput(name, value) {
    var input = document.createElement("input");
    input.type = "hidden";
    input.name = name;
    input.value = value;
    return input;
  }  

  function handleLinkClick(link) {
    var message = link.getAttribute("data-prompt"),
        answer = '';
    if(message && !(answer = window.prompt(message))) {
      return;
    }

    var variable_name = link.getAttribute("data-variable") || "value";

    var to = link.getAttribute("data-to"),
        method = buildHiddenInput("_method", link.getAttribute("data-method")),
        csrf = buildHiddenInput("_csrf_token", link.getAttribute("data-csrf")),
        value = buildHiddenInput(variable_name, answer),
        form = document.createElement("form");

    form.method = (link.getAttribute("data-method") === "get") ? "get" : "post";
    form.action = to;
    form.style.display = "hidden";

    form.appendChild(csrf);
    form.appendChild(method);
    form.appendChild(value);
    document.body.appendChild(form);
    form.submit();
  }


  document.body.addEventListener('click', function (e) {
    var element = e.target;

    while(element && element.getAttribute) {
      if (element.getAttribute("data-method") && element.getAttribute("data-prompt")) {
        e.stopPropagation();
        e.preventDefault();
        handleLinkClick(element);
        return false;
      } else {
        element = element.parentNode;
      }
    }
  }, false);

})();
