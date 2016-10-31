<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
img {
	width: 40px;
	height: 40px;
}

#profile {
	width: 70px;
	height: 70px;
}

.modal-header {
	background-color: #ffc4b2;
}

.modal-body {
	height: 300px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Modal Example</h2>
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">Open Modal</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<div class="row">
							<div class="col-sm-2">
								<img src="/BootstrapTest/images/default.png" id="profile">
							</div>
							<div class="col-sm-6">
								<h4 class="modal-title">NickName</h4>
							</div>
							<div class="col-sm-4" align="right">
								<h5>
									<img src="/BootstrapTest/images/cam.png"> <img
										src="/BootstrapTest/images/movie.png">
								</h5>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<textarea class="form-control" rows="12" id="comment"
								placeholder="우리들의 핫 플레이스.."></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<img src="/BootstrapTest/images/comment.png">
						<button type="button" class="btn btn-primary">post</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

