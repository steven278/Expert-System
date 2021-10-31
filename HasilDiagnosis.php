<?php if(!isset($_POST['button'])){
    header("Location: pertanyaan.php");
    die();
} ?>
<?php
    // untuk memanggil file
    include 'Crud.php';
    // untuk mendeklarasikan class menjadi variabel
    $crud = new Crud();
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <link href="css/hasilDiagnosisStyle.css" rel="stylesheet">
    <title>DSION-Result</title>
</head>
<body>
<?php include 'Navbar.php'; ?>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-7">
                <h1>Hasil Diagnosis</h1>
                <?php
                    if (isset($_POST['button']))
                    {
                      if(!isset($_POST['gejala'])){
                          header("Location: pertanyaan.php");
                          die(); 
                      }
                      // group kemungkinan terdapat penyakit
                      $groupKemungkinanPenyakit = $crud->getGroupPengetahuan(implode(",", $_POST['gejala']));
                      // menampilkan kode gejala yang di pilih
                      $sql = $_POST['gejala'];
                      if (isset($sql)) {
                        // mencari data penyakit kemungkinan dari gejala
                        for ($h=0; $h < count($sql); $h++) {
                          $kemungkinanPenyakit[] = $crud->getKemungkinanPenyakit($sql[$h]);
                          for ($x=0; $x < count($kemungkinanPenyakit[$h]); $x++) {
                            for ($i=0; $i < count($groupKemungkinanPenyakit); $i++) {
                              $namaPenyakit = $groupKemungkinanPenyakit[$i]['nama_penyakit'];
                              if ($kemungkinanPenyakit[$h][$x]['nama_penyakit'] == $namaPenyakit) {
                                // list di kemungkinan dari gejala
                                $listIdKemungkinan[$namaPenyakit][] = $kemungkinanPenyakit[$h][$x]['id_pengetahuan'];
                              }
                            }
                          }
                        }

                        $id_penyakit_terbesar = '';
                        $nama_penyakit_terbesar = '';
                        // list penyakit kemungkinan
                        for ($h=0; $h < count($groupKemungkinanPenyakit); $h++) { 
                          $namaPenyakit = $groupKemungkinanPenyakit[$h]['nama_penyakit'];
                          "<br/>Proses Penyakit ".$h.".".$namaPenyakit."<br/>==============<br/>";
                          
                          // list penyakit kemungkinan dari gejala
                          for ($x=0; $x < count($listIdKemungkinan[$namaPenyakit]); $x++) { 
                            $daftarKemungkinanPenyakit = $crud->getListPenyakit($listIdKemungkinan[$namaPenyakit][$x]);
                            
                            "<br/>proses ".$x."<br/>------------------------------------<br/>";
                                    
                            for ($i=0; $i < count($daftarKemungkinanPenyakit); $i++) {
                                
                                if (count($listIdKemungkinan) == 1) {
                                  "Jumlah Gejala = ".
                                    count($listIdKemungkinan[$namaPenyakit])."<br/>";
                                      
                                  // bila list kemungkinan terdapat 1
                                  $mb = $daftarKemungkinanPenyakit[$i]['mb'];
                                  $md = $daftarKemungkinanPenyakit[$i]['md'];
                                  $cf = $mb - $md;
                                  $daftar_cf[$namaPenyakit][] = $cf;

                                  "<br/>proses 1<br/>------------------------<br/>";
                                  "mb = ".$mb."<br/>";
                                "md = ".$md."<br/>";
                                  "cf = mb - md = ".$mb." - ".$md." = ".$cf."<br/><br/><br/>";
                                  // end bila list kemungkinan terdapat 1
                                } else {
                                  // list kemungkinanan lebih dari satu
                                  if ($x == 0)
                                  {
                                    "Jumlah Gejala = ".
                                    count($listIdKemungkinan[$namaPenyakit])."<br/>";
                                    // record md dan mb sebelumnya
                                    $mblama = $daftarKemungkinanPenyakit[$i]['mb'];
                                    $mdlama = $daftarKemungkinanPenyakit[$i]['md'];
                                    // md yang di esekusi
                                    $mb = $daftarKemungkinanPenyakit[$i]['mb'];
                                    $md = $daftarKemungkinanPenyakit[$i]['md'];
                                    "<br/>";
                                    "mbbaru = ".$mb."<br/>";
                                    "mdbaru = ".$md."<br/>";
                                    $cf = $mb - $md;
                                    "cf = mb - md = ".$mb." - ".$md." = ".$cf."<br/><br/><br/>";

                                    $daftar_cf[$namaPenyakit][] = $cf;
                                  } 
                                  else
                                  {
                                    $mbbaru = $daftarKemungkinanPenyakit[$i]['mb'];
                                    $mdbaru = $daftarKemungkinanPenyakit[$i]['md'];
                                    "mbbaru = ".$mbbaru."<br/>";
                                    "mdbaru = ".$mdbaru."<br/>";
                                    $mbsementara = $mblama + ($mbbaru * (1 - $mblama));
                                    $mdsementara = $mdlama + ($mdbaru * (1 - $mdlama));
                                    "mbsementara = mblama + (mbbaru * (1 - mblama)) = $mblama + ($mbbaru * (1 - $mblama)) = ".$mbsementara."<br/>";
                                    "mdsementara = mdlama + (mdbaru * (1 - mdlama)) = $mdlama + ($mdbaru * (1 - $mdlama)) = ".$mdsementara."<br/>";

                                    $mb = $mbsementara;
                                    $md = $mdsementara;
                                    $cf = $mb - $md;
                                    "cf = mblama - mdlama = ".$mb." - ".$md." = ".$cf."<br/><br/><br/>";
                                    $daftar_cf[$namaPenyakit][] = $cf;;
                                  }
                                  // end list kemungkinanan lebih dari satu
                                }
                              }
                            }  
                          }
                        }
                  ?>
                  <table class="table table-light table-bordered border-dark" style="text-align: center;">
                    <thead class="table-info table-bordered border-dark">
                      <tr>
                        <th scope="col">Nama Penyakit</th>
                        <th scope="col">Nilai CF</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <?php   
                          $crud->hasilCFTertinggi($daftar_cf,$groupKemungkinanPenyakit);
                        ?>
                      </tr>
                    </tbody>
                  </table>
                  <h2 style="font-family: 'Permanent Marker', cursive;"> Kemungkinan Penyakit Anda : </h2>
                  <form name="form_diagnosis" action="Solusi.php" method="POST">
                    <ul style="font-family: 'Source Sans Pro', sans-serif; font-size:24px;">  
                      <?php $crud->hasilAkhir($daftar_cf,$groupKemungkinanPenyakit); ?>
                    </ul>
                    <button id="btn-solusi" type="submit" name="btn-solusi">Solusi</button>
                  </form>
                <?php } ?>
                
            </div>
            <div class="col-md-5">
              <img src="images/Depression 3.svg" width="100%">
            </div>
        </div>
    </div>
</body>
</html>