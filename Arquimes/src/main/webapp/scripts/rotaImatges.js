(function($) {
	    $.fn.seqfx = function() {
	        var elements = this,
	            l = elements.length,
	            i = 0;
	        function execute() {
	            if (l>1){         
	                var current = $(elements[i]);
	                i = (i + 1) % l;
	                current
	                    .fadeIn(400)
	                    .delay(4000)
	                    .fadeOut(300, execute);
	                }
	             else
	                $(elements[i]).show();
	        }
	        execute();
	        return this;
	    };
	}(jQuery));
