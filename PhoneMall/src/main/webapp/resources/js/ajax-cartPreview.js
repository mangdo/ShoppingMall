/**
 * 
 */

// 숫자 세자리마다 콤마 찍기
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	
// Immediately-invoked function to get colorList 
 (function(){
	 $.ajax({
			type: 'POST',
			url: "/purchase/cartPreview",
			//data: JSON.stringify(formData),
			//contentType: "application/json"
			dataType : 'json',
	})
	.done(function(response) {

		$("#total_money").html(numberWithCommas(response.total_money)+" ₩");
		
		var str = '';
		
		$(response.list).each(function(i, product){
			str += '<div class="single-cart clearfix"> <div class="pro-thumbnail-img f-left">';
			
			var imageName = encodeURIComponent(product.product_imageList[0].image_uploadPath+'/s_'+product.product_imageList[0].image_uuid+'_'+product.product_imageList[0].image_name);
			
			str += '<a href="#"> <img src="/product/display?fileName='+ imageName +'" alt="Cart Product" /> </a> </div>';
			str += '<div class="cart-info f-left"> <h6 class="text-capitalize"> <a href="#">'+product.product_title+'</a> </h6>';
			str += '<p><span>Brand <strong>:</strong></span>'+product.product_brand+'</p>';
			str += '<p><span>Carrier <strong>:</strong></span>'+product.product_carrier+'</p>';
			str += '<p><span>Color <strong>:</strong></span>'+product.product_color+'</p> </div> </div>';
		});
		
		$(".total-cart-pro").html(str);
		
        $("#cart-quantity").html(response.list.length);
        
	})
	.fail(function(data) {
		console.log(data);
	});
 })();