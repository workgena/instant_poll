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


//
// Resize <textarea>
//
(function() {
  var observe;
  if (window.attachEvent) {
    observe = function (element, event, handler) {
      element.attachEvent('on' + event, handler);
    };
  }
  else {
    observe = function (element, event, handler) {
      element.addEventListener(event, handler, false);
    };
  }
  function init () {
    var text = document.getElementById('question_answers');
    function resize () {
      text.style.height = 'auto';
      text.style.height = (text.scrollHeight + 5) + 'px';
    }
    /* 0-timeout to get the already changed text */
    function delayedResize () {
      window.setTimeout(resize, 0);
    }
    observe(text, 'change',  resize);
    observe(text, 'cut',     delayedResize);
    observe(text, 'paste',   delayedResize);
    observe(text, 'drop',    delayedResize);
    observe(text, 'keydown', delayedResize);

    text.focus();
    text.select();
    resize();
  }

  window.onload = function() {
    init();
  };
})();



//
// Dynamic input[text] for answers
//
(function() {
  var observe;
  if (window.attachEvent) {
    observe = function (element, event, handler) {
      element.attachEvent('on' + event, handler);
    };
  }
  else {
    observe = function (element, event, handler) {
      element.addEventListener(event, handler, false);
    };
  }

  function init () {
    // var input = document.getElementById('question_answers');
    var parentNode = document.getElementById('js-answers-input-container');
    if (!parentNode) { return; }

    function resize (input) {
      var lastInput = parentNode.querySelector(':last-child');
      if (input.value.length && lastInput.value.length) {
        var cln = input.cloneNode(true);
        cln.value = "";
        parentNode.appendChild(cln);
      }
    }

    parentNode.addEventListener('change', function (e) {
      resize(e.target);
    }, false);

    resize(parentNode.querySelector(':last-child'));
  }

  window.onload = function() {
    init();
  };
})();
