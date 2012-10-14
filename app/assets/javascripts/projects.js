      $(function() {
	    
	initMap = function() {
	    	    if(google == null)
			return;

	    if(document.getElementById('map_canvas') ==null)
		return;
	    initMap=function(){
		
	    };
		    
        var mapOptions = {
          center: new google.maps.LatLng(-33.8688, 151.2195),
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById('map_canvas'),
          mapOptions);
      
        var input = document.getElementById('searchTextField');
        var autocomplete = new google.maps.places.Autocomplete(input);
      
        autocomplete.bindTo('bounds', map);
      
        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map
        });
      
        google.maps.event.addListener(autocomplete, 'place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // Inform the user that the place was not found and return.
            alert('location not found');
            return;
          }
      
          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          var image = new google.maps.MarkerImage(
              place.icon,
              new google.maps.Size(71, 71),
              new google.maps.Point(0, 0),
              new google.maps.Point(17, 34),
              new google.maps.Size(35, 35));
          marker.setIcon(image);
          marker.setPosition(place.geometry.location);
          $("#Xa").val(place.geometry.location.Xa);
          $("#Ya").val(place.geometry.location.Ya);
      
          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }
      
          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

		};

		
		    
		    
		    
		    setTimeout('initMap()', 2000);
		    setTimeout('initMap()', 4000);
		    setTimeout('initMap()', 6000);
		    setTimeout('initMap()', 8000);
		
	    
	    var showLoading = function(){
		
		$.mobile.loading( 'show');

	    };

	    var hideLoading = function(){
		$.mobile.loading( 'hide');
	    };

	    var fetchComments = function(){
		showLoading();
		$.get(window.location + '/comments', function(data) {
			  $('#comments_container').html(data);
			  $('#comments_container').trigger('create');
			  hideLoading();
		      });
		
	    };

	    var fetchTodos = function() {
		
		showLoading();
			$.get(window.location + '/todos', function(data) {
			  $('#todo_contiiner').html(data);
			  $('#todo_contiiner').trigger('create');
			  hideLoading();
		      });
	    };

	    var clearMessage = function(){
		$('#comment_comment').val('');
		
	    };

	    var clearTodo = function(){
		$('#todo_task').val('');
		
	    };


	    setTimeout('2000', fetchComments);
	    $('#new_comment').submit(function(){
					 showLoading();
				   	 $.post($(this).attr('action'), $(this).serialize(), fetchComments).complete(clearMessage);
					 return false;
				     });



	    $('#new_todo').submit(function(){
					 showLoading();
				   	 $.post($(this).attr('action'), $(this).serialize(), fetchTodos).complete(clearTodo);
					 return false;
				     });


	    if($("#Gallery a").length > 0){
		
	    
		$("#Gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false });
	    }

	    $('.todo_checkboxes').live('change', function(){
					   $.post(window.location + "/todos/" + $(this).val() + "/flip");
				       });

	});
      
