HTMLWidgets.widget({

  name: 'egg',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        el.innerText = x.egg;

        if(x.hasOwnProperty('imegg')){
          var elem = document.createElement("img");
          elem.setAttribute("height", "100%");
          elem.setAttribute("width", "100%");
          document.getElementById(el.id).appendChild(elem);
          elem.src = x.imegg;
        }

        var egg = new Egg(x.stroke, function() {
          jQuery('#' + el.id).fadeIn(500, function() {
            window.setTimeout(function() { jQuery('#' + el.id).hide(); }, x.timeout);
          });
        }).listen();

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
