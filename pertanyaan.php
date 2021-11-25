<?php 
include 'Crud.php';
$crud = new Crud;
$arrayName = $crud->readGejala(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<title>DSION-Question</title>
	<link href="css/pertanyaanStyle.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&family=Roboto&display=swap" rel="stylesheet">
</head>
<body>
	<?php include 'Navbar.php'; ?>
	<div class="container mt-5">
		<div class="row">
			<h1 class="mb-5">GEJALA</h1>
			<h3 class="mb-5" style="font-family: 'Permanent Marker', cursive;color: #6E5477 ;font-size: 24px;">Silahkan checklist minimal 5 gejala yang anda alami</h3>
			<div class="col-sm-6 col-md-7">
				<!-- <table class="table table-light table-bordered border-dark">
					<thead class="table-primary table-bordered border-dark"> -->
				<form name="form_gejala" action="HasilDiagnosis.php" method="POST">
					<table class="table table-light table-bordered border-dark">
						<thead class="table-info table-bordered border-dark">
							<tr>
								<th scope="col">Checklist</th>
								<th scope="col">Gejala yang dirasakan</th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach($arrayName as $r){ ?>
							<tr>
								<th scope="row"><input id="gejala<?php echo $r['id_gejala']; ?>" name="gejala[]" type="checkbox" value="<?php echo $r['id_gejala']; ?>" style="width: 1.5em; height:1.5em;"></th>
								<td><?php echo $r['nama_gejala']; ?><br/></td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
					<div class="col-sm-6 col-md-8 mx-auto">
						<button type="submit" id="btn-solusi" name="button">Process</button>
					</div>
				</form>
				
			</div>
			<div class="col-sm-6 col-md-5 mt-5">
				<img src="images/Depression 2.svg" alt="Depression_image" width="100%">
			</div>
		</div>
	</div>
</body>
</html>