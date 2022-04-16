(function($){
    const tag_on_class = "w3-theme-tag-on";
    const tag_off_class = "w3-theme-tag-off";
	const not_show_class = "not-show";

	$(document).ready(function(){
		var selectedTags = [];
		$(document).on('click','.tag-filter',function(){
			if( $(this).hasClass('all')){
				selectedTags = [];
				$('span.tag-filter').removeClass(tag_on_class);
				$('span.tag-filter').addClass(tag_off_class);
				$(this).removeClass(tag_off_class);
				$(this).addClass(tag_on_class);
				$('.project-item').showAll();
			}else{
				if( $(this).hasClass(tag_on_class) ){
					selectedTags.removeTag( $(this).data('tag') );
					$(this).removeClass(tag_on_class);
					$(this).addClass(tag_off_class);
				}
				else{
					selectedTags.addTag( $(this).data('tag') );
					$(this).removeClass(tag_off_class);
					$(this).addClass(tag_on_class);
				}
				$('.project-item').filterTags( selectedTags );
			}
		});
	});

	Array.prototype.addTag = function(tag) {
		if(this.indexOf(tag) === -1) this.push(tag);
	}

	Array.prototype.removeTag = function(tag) {
		var tagIndex = this.indexOf(tag);
		this.splice(tagIndex,1);
	}

	$.fn.extend({
	  filterTags: function(tagNames) {
	  	if(tagNames.length == 0) return this.showAll();

	    return this.each(function() {
	    	var itemTagArray = JSON.parse( $(this).attr('data-tags') );
	    	var unfound = $( tagNames ).not( itemTagArray ).get();
	    	if( unfound.length == tagNames.length ){
				$(this).addClass(not_show_class);
			}else{
				$(this).removeClass(not_show_class);
			}
	    });
	  },
	  showAll: function(){
	  	return this.each(function() {
			if($(this).hasClass(not_show_class)){
				$(this).removeClass(not_show_class);
			}
	    });
	  }
	});
})(jQuery)
