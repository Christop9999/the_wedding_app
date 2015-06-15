$ -> 
  $('.masonry-pins').imagesLoaded ->
    $('.masonry-pins').masonry
      itemSelector: '.box'
      isFitWidth: true