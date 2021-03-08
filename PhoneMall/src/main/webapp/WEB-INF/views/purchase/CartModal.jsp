<!DOCTYPE HTML>
<html>
 
<head>
    <meta charset="UTF-8">
    <title>해당하는 페이지 이름</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
 
<body>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" id="modal_show">
        JQUERY를 이용한 모달 열기
    </button>
 
    <!-- Modal -->
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
 
 
 
 
 <!-- modal ex -->
        <!-- product option Modal -->
											<div class="OptionModal" id="optionModal" style="margin-left:-160px;">
												<div class="modal-dialog">
												<!-- Modal content-->
													<div class="modal-content" style="width:50%;">
														<div class="modal-header">		
														</div>
														<div class="modal-body" style="height: 80px;">
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
                                                                    			<input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                                                			</div>
																		</td>
																		<td>
																			<div class="color select box" style="border:black;">
                                                                	<select name="job">
    																	<option value="">color</option>
    																	<option value="학생">학생</option>
    																	<option value="회사원">회사원</option>
    																	<option value="기타">기타</option>
																	</select>
                                                                </div>
																		</td>
																	</tr>
																</tbody>
															</table>
															
                                                        
														</div>
														<div class="modal-footer">
														<button type="button" id="modal_close_btn" class="btn btn-default" data-dismiss="modal">Close</button>
														</div>
													</div>
  <!-- modal ex -->
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
</body>
 
</html>