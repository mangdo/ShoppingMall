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
	
	function update(reply, callback, error){
		
		$.ajax({
			type : 'put',
			url : '/reviews/replies/'+reply.reply_id,
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
	
	function get(reply_id, callback, error){
		$.get("/reviews/replies/"+reply_id+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){ error(); }
		});
	}
	
	return {
		add:add,
		remove:remove,
		update:update,
		get:get
	};
})();