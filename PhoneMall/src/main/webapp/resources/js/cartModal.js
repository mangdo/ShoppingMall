/**
 * 
 */
var optionModal = $("#optionModal");
function openModal(product_id,product_price) {

	optionModal.modal('show');
	var price = product_price;
	var id = product_id;

	$.getJSON("/product/getColorList",{product_id : id}, function(arr){
		 str="";
		 str2 = "";
		 str3 = "";
		 $(arr).each(function(i, color){
			str = str + "<option value='"+color.product_color+"'>"+color.product_color+"</option>";

		 });
		 str2 = str2 + "<input type='hidden' name='product_id' value='"+product_id+"'/>"
		 str3 = str3 + "<input type='hidden' name='product_price' value='"+price+"'/>"
		 $("#select2").empty().append(str);
		 $("#hiddenInput").empty().append(str2);
		 $("#hiddenInput").append(str3)
	 });

};