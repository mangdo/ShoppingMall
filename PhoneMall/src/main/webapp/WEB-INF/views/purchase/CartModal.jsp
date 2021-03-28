<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- option Modal -->
<!-- Modal -->
<div class="modal fade" id="optionModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <form name="form1" action="/purchase/insertCart" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            	<h4 class="modal-title">옵션 선택</h4>
            </div>
            <div class="modal-body">
            	<div id="hiddenInput"></div>
				<table>
					<thead style="color: black;">
						<tr>
							<td>수량</td>
							<td>색깔</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="cart-plus-minus f-left" style="text-align:center;">
                                      <input type="text" value="02" name="product_qty" class="cart-plus-minus-box">
                                </div>
							</td>
							<td>
								<div id="colorSelectBox" style="border:black;">
                                     <select name="product_color" id="select2">
									 </select>
                                </div>
							</td>
						</tr>
				   </tbody>
				</table>
            </div><!-- .modal-body -->
            <div class="modal-footer">
            	<button id="AddToCartBtn" class="submit-btn-1 btn-hover-1" type="submit">Add to Cart</button>
            	<button class="submit-btn-1 btn-hover-1" data-dismiss="modal" aria-label="Close" style="background-color : #575757;">취소</button>
            </div>
        </div><!-- .modal-content -->
       </form>
    </div><!-- .modal-dialog -->
</div>
<!-- END Modal -->

	
<!-- Button trigger modal 
    <button type="button" class="btn btn-primary" id="modal_show">
        JQUERY를 이용한 모달 열기
    </button>
 
    <!-- Modal
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="cart-plus-minus f-left">
                    	<input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                    </div> 
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                    <button type="button" class="btn btn-primary" id="close_modal">다른 방식으로 모달 닫기</button>
                </div>
            </div>
        </div>
    </div>

  <!-- modal ex
    <script>
        $(document).ready(function() {
            $("#modal_show").click(function() {
                $("#exampleModal").modal("show");
            });
 
            $("#close_modal").click(function() {
                $("#exampleModal").modal("hide");
            });
        });
    </script>
-->