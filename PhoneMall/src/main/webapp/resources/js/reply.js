/**
 * 
 */
console.log("javaScript Module pattern");

var replyService = (function(){
	
	function add(reply, callback){
		
		$.ajax({
			type : 'post',
			url : '/reviews/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}


	function remove(reply_id, callback, error){
		$.ajax({
			type : 'delete',
			url : '/reviews/replies/'+reply_id,
			success : function(deleteResult, stauts, xhr){
				if(callback){
					callback(deleteResult);
				}
			}, error : function(shr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	return {
		add:add,
		remove: remove
	};
})();