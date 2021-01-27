/**
 * 
 */

console.log("javaScript Module pattern");

var reviewService = (function(){
	
	function add(review, callback){
		
		$.ajax({
			type : 'post',
			url : '/reviews/new',
			data : JSON.stringify(review),
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

	function getList(param, callback, error){
		var product_id = param.product_id;
		var page = param.page || 1;
		$.getJSON("/reviews/pages/"+product_id+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.reviewCount, data.reviewList);
				}
			}).fail(function(xhr, status, err){
				if(error){error();}
			});
	}
	
	function remove(review_id, reviewer, callback, error){
		$.ajax({
			type : 'delete',
			url : '/reviews/'+ review_id,
			data : JSON.stringify({review_id:review_id, review_reviewer:reviewer}),
			contentType : "application/json; charset=utf-8",
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
	
	function update(review, callback, error){
		
		$.ajax({
			type : 'put',
			url : '/reviews/'+review.review_id,
			data : JSON.stringify(review),
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
	
	function get(review_id, callback, error){
		$.get("/reviews/"+review_id+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){ error(); }
		});
	}
	
	function displayTime(timeValue){
		var dateObj = new Date(timeValue);
		
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth()+1;
		var dd= dateObj.getDate();
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [yy, '/', (mm>9? '':'0')+mm, '/', (dd>9? '':'0')+dd,'  ',
		(hh>9? '':'0')+hh,':',(mi>9? '':'0')+mi,':',(ss>9? '':'0')+ss].join('');
		
		
		
	}
	return {
		add:add,
		getList : getList,
		remove: remove,
		update :update,
		get : get,
		displayTime : displayTime
	
	};
})();