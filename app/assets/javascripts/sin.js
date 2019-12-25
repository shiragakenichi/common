$(function(){
  $(document).on('click', '.facebook-icon', function(){
    $('.sns-box-facebook') .css('display','inline-block'
   
    )
    5500,  
    'linear'
  });
});

$(function(){
  $(document).on('click', '.fab.fa-google', function(){
    $('.sns-box-google') .css('display','inline-block'

    )
  });
});

$(function(){
  $(document).on('click', '.fab.fa-twitter', function(){
    $('.sns-box-twitter') .css('display','inline-block'

    )
  });
});


$(function(){
  $("label").on("change", 'input[type="file"]', function(e) {
    var file =  e.target.files[0],
        render =  new FileReader();

    if(file.type.indexOf("image") < 0){
      return false;
    }
    console.log(file)

    render.onload =(function(file) {
      return function(e){
        $(".image-box").empty();
        $(".image-box").append($('<img>').attr({
          src: e.target.result,
          // width:"180px",
          height:"180px",
          class: "preview__image",
          title: file.name
        }));

        $(".image-box").append('<div class="preview__bottom"><div class="preview__edit"><a class="preview__edit--anchor">編集</a></div><div class="preview__delete"><a class="preview__delete--anchor">削除</a></div></div>');

        $(".preview__delete--anchor").on("click", function(){
          var val = $('input[type="file"]').val();
          console.log(val);
          $(".preview").children().remove();
          $(".preview__image").css({"display":"none"});
          $(".preview__bottom").css({"display":"none"});
          $('input[type="file"]').val("");
          var val = $('input[type="file"]').val();
          console.log(val);
        });

        $(".preview__edit--anchor").on("click", function(){
          var val = $('input[type="file"]').val();
          console.log(val);
          $(".preview").children().remove();
          $(".preview__image").css({"display":"none"});
          $(".preview__bottom").css({"display":"none"});
         // $('input[type="file"]').val("");
          var val = $('input[type="file"]').val();
          console.log(val);
        });
      };
    })(file);


    render.readAsDataURL(file);
  });
});






