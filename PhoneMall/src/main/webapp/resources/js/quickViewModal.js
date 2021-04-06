/**
 * 
 */

  // SDK initialize. JavaScript key setting
  Kakao.init('d00f63718609a89c057bd974d2e26999');
  // share kakao message
  function sendLink(data) {
    Kakao.Link.createDefaultButton({
   	  container: '#kakao-link-btn',
      objectType: 'commerce',
      content: {
        title: data.product_information,
        imageUrl:
        	'https://cdn.pixabay.com/photo/2017/06/04/20/31/tablet-2372149_960_720.png',
        link: {
          mobileWebUrl: 'http://localhost:8080/product/get?product_id='+data.product_id,
          webUrl: 'http://localhost:8080/product/get?product_id='+data.product_id,
        },
      },
      commerce: {
        productName: data.product_title,
        regularPrice: data.product_price,

      },
      buttons: [
        {
          title: '구매하기',
          link: {
            mobileWebUrl: 'http://localhost:8080/product/get?product_id='+data.product_id,
            webUrl: 'http://localhost:8080/product/get?product_id='+data.product_id,
          },
        },
      ],
    })
  }

  // count money
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

$('#productModal').on('show.bs.modal', function(e) {
	var product_id = $(e.relatedTarget).data('id');
	$.getJSON("/product/quickView?product_id="+product_id, function(data){
		
		$("#quick-id").attr( "href", "/product/get?product_id="+data.product_id );
		$("#product_id").val(data.product_id);
	    $("#quick-title").html( data.product_title );
	    $("#quick-price").html( numberWithCommas(data.product_price) +" 원");
	    $("#product_price").val(data.product_price);
	    $("#quick-information").html( data.product_information );
	    
	    var str = '';
	    data.product_colorList.forEach(function(color){
	    	str += '<option value='+color.product_color+'>'+color.product_color+'</option>';
	    });
	    $("#product_color").html(str);
	    
	    var imageName = encodeURIComponent(data.product_imageList[0].image_uploadPath+'/'+data.product_imageList[0].image_uuid+'_'+data.product_imageList[0].image_name);
        var realSrc = '/product/display?fileName='+imageName;
		$("#quick-img").attr("src",realSrc);
		sendLink(data);
	});

});	