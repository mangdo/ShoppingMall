/**
 * javaScript Module pattern 
 * insert wishList
 */
var wishListService = (function(){
	
	function insert(product_id){
		
		$.ajax({
			type : 'post',
			url : '/product/insertWishListJson',
			data : JSON.stringify({product_id:product_id}),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if( result == "insert in wishList")
					alert("성공적으로 추가되었습니다!");
				else if( result == "aleady in wishList")
					alert("이미 위시리스트에 존재하는 상품입니다");
				else{
					alert("실패하였습니다.");
				}
			},
			error : function(xhr, status, er){
				alert("실패하였습니다.");
			}
		});
	}
	return {
		insert:insert
	};
})();