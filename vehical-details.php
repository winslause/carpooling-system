<?php
session_start();
include('includes/config.php');
error_reporting(0);
//  if (isset($_POST['submit'])) {
//    $date = $_POST['date'];
//    $time = $_POST['time'];
//    $message = $_POST['message'];
//    $useremail = $_SESSION['login'];
//    $status = 0;
//    $vhid = $_GET['vhid'];
//    $bookingno = mt_rand(100000000, 999999999);
//   //$ret = "SELECT tblvehicles.Vimage as Vimage,tblvehicles.VehicleTitle,tblvehicles.id as vid,tblroutes.routeName,tblbooking.fDate,tblbooking.fTime,tblbooking.message,tblbooking.Status,tblvehicles.price,tblvehicles.freeseats,tblvehicles.drivername,tblvehicles.drivercontacts,tblbooking.BookingNumber  from tblbooking join tblvehicles on tblbooking.VehicleId=tblvehicles.id join tblroutes on tblroutes.id=tblvehicles.routename where tblbooking.userEmail=:useremail order by tblbooking.id desc";
//   $ret = "SELECT * FROM tblbooking where VehicleId=:vhid";
//    $query1 = $dbh->prepare($ret);
//   $query1->bindParam(':bookingno', $bookingno, PDO::PARAM_STR);
//   $query1->bindParam(':useremail', $useremail, PDO::PARAM_STR);
//   $query1->bindParam(':vhid', $vhid, PDO::PARAM_STR);
//   $query1->bindParam(':date', $date, PDO::PARAM_STR);
//   $query1->bindParam(':time', $time, PDO::PARAM_STR);
//   $query1->bindParam(':message', $message, PDO::PARAM_STR);
//   $query1->bindParam(':status', $status, PDO::PARAM_STR);
//    $query1->execute();
//    $results1 = $query1->fetchAll(PDO::FETCH_OBJ);


if (isset($_POST['submit'])) {
    $date = $_POST['fdate'];
    $time = $_POST['ftime'];
    $message = $_POST['fmessage'];
    $useremail = $_SESSION['login'];
    $status = 0;
    $vhid = $_GET['vhid'];
    $bookingno = mt_rand(100000000, 999999999);
    $sql = "INSERT INTO  tblbooking(BookingNumber,userEmail,VehicleId, fDate,fTime,message,Status) VALUES(:bookingno,:useremail,:vhid,:date,:time,:message,:status)";
    $query = $dbh->prepare($sql);
    $query->bindParam(':bookingno', $bookingno, PDO::PARAM_STR);
    $query->bindParam(':useremail', $useremail, PDO::PARAM_STR);
    $query->bindParam(':vhid', $vhid, PDO::PARAM_STR);
    $query->bindParam(':date', $date, PDO::PARAM_STR);
    $query->bindParam(':time', $time, PDO::PARAM_STR);
    $query->bindParam(':message', $message, PDO::PARAM_STR);
    $query->bindParam(':status', $status, PDO::PARAM_STR);
    $query->execute();
    //$lastInsertId = $dbh->lastInsertId();



    if ($query->rowCount() > 0) {
    //     $sql = "INSERT INTO  tblbooking(BookingNumber,userEmail,VehicleId, fDate,fTime,message,Status) VALUES(:bookingno,:useremail,:vhid,:date,:time,:message,:status)";
    //     $query = $dbh->prepare($sql);
        // $query = $dbh->prepare($sql);
        // $query->bindParam(':bookingno', $bookingno, PDO::PARAM_STR);
        // $query->bindParam(':useremail', $useremail, PDO::PARAM_STR);
        // $query->bindParam(':vhid', $vhid, PDO::PARAM_STR);
        // $query->bindParam(':date', $date, PDO::PARAM_STR);
        // $query->bindParam(':time', $time, PDO::PARAM_STR);
        // $query->bindParam(':message', $message, PDO::PARAM_STR);
        // $query->bindParam(':status', $status, PDO::PARAM_STR);
        // $query->execute();
        // $lastInsertId = $dbh->lastInsertId();


        // if ($lastInsertId) {
        echo "<script>alert('Booking successfull.');</script>";
        $vhid = $_GET['vhid'];
        $sql = "SELECT tblvehicles.*,tblroutes.routename,tblroutes.id as bid  from tblvehicles join tblroutes on tblroutes.id=tblvehicles.routename where tblvehicles.id=:vhid";
        $sql = "UPDATE tblvehicles set freeseats = freeseats - 1 where id = :vhid AND freeseats >= 1";
        $query = $dbh->prepare($sql);
        $query->bindParam(':vhid', $vhid, PDO::PARAM_STR);
        $query->execute();
        $results = $query->fetchAll(PDO::FETCH_OBJ);
         // $freeseats = ($results->freeseats);  


        echo "<script type='text/javascript'> document.location = 'payment.php'; </script>";
    } else {
        echo "<script>alert('Car already full');</script>";
        echo "<script type='text/javascript'> document.location = 'car-listing.php'; </script>";
    }
}
?>


<!DOCTYPE HTML>
<html lang="en">

<head>

  <title> Vehicle Details</title>
  <!--Bootstrap -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
  <!--Custome Style -->
  <link rel="stylesheet" href="assets/css/style.css" type="text/css">
  <!--OWL Carousel slider-->
  <link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
  <link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
  <!--slick-slider -->
  <link href="assets/css/slick.css" rel="stylesheet">
  <!--bootstrap-slider -->
  <link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
  <!--FontAwesome Font Style -->
  <link href="assets/css/font-awesome.min.css" rel="stylesheet">

  <!-- SWITCHER -->
  <link rel="stylesheet" id="switcher-css" type="text/css" href="assets/switcher/css/switcher.css" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/red.css" title="red" media="all" data-default-color="true" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/orange.css" title="orange" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/blue.css" title="blue" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/pink.css" title="pink" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/green.css" title="green" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/purple.css" title="purple" media="all" />
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/images/favicon-icon/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/images/favicon-icon/apple-touch-icon-114-precomposed.html">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/images/favicon-icon/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="assets/images/favicon-icon/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="assets/images/favicon-icon/favicon.png">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
</head>

<body>

  <!-- Start Switcher -->
  <?php include('includes/colorswitcher.php'); ?>
  <!-- /Switcher -->

  <!--Header-->
  <?php include('includes/header.php'); ?>
  <!-- /Header -->

  <!--Listing-Image-Slider-->

  <?php
  $vhid = intval($_GET['vhid']);
  $sql = "SELECT tblvehicles.*,tblroutes.routename,tblroutes.id as bid  from tblvehicles join tblroutes on tblroutes.id=tblvehicles.routename where tblvehicles.id=:vhid";
  $query = $dbh->prepare($sql);
  $query->bindParam(':vhid', $vhid, PDO::PARAM_STR);
  $query->execute();
  $results = $query->fetchAll(PDO::FETCH_OBJ);
  $cnt = 1;
  if ($query->rowCount() > 0) {
    foreach ($results as $result) {
      $_SESSION['brndid'] = $result->bid;
  ?>

      <section id="listing_img_slider">
        <div><img src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage); ?>" class="img-responsive" alt="image" width="900" height="560"></div>
      </section>
      <!--/Listing-Image-Slider-->


      <!--Listing-detail-->
      <section class="listing-detail">
        <div class="container">
          <div class="listing_detail_head row">
            <div class="col-md-9">
              <h2><?php echo htmlentities($result->routename); ?> , <?php echo htmlentities($result->VehiclesTitle); ?></h2>
            </div>
            <div class="col-md-3">
              <div class="price_info">

                <p> SH.<?php echo htmlentities($result->price);  ?> </p>

              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-9">
              <div class="main_features">
                <ul>

                  <li> <i class="fa fa-car" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result->drivername); ?></h5>
                    <p>Driver Name</p>
                  </li>
                  <li> <i class="fa fa-address-book" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result->drivercontacts); ?></h5>
                    <p>Driver Contact</p>
                  </li>
                  <li> <i class="fa fa-money" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result->price); ?></h5>
                    <p>Price per Ride</p>
                  </li>

                  <li> <i class="fa fa-user-plus" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result->freeseats); ?></h5>
                    <p>Available Seats</p>
                  </li>
                  <li> <i class="fa fa-calendar" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result->picktime); ?></h5>
                    <p>picktime</p>
                  </li>

                  </li>
                </ul>
              </div>
              <div class="listing_more_info">
                <div class="listing_detail_wrap">
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs gray-bg" role="tablist">
                    <li role="presentation" class="active"><a href="#vehicle-overview " aria-controls="vehicle-overview" role="tab" data-toggle="tab">Vehicle Overview </a></li>


                  </ul>

                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!-- vehicle-overview -->
                    <div role="tabpanel" class="tab-pane active" id="vehicle-overview">

                      <p><?php echo htmlentities($result->drivermessage); ?></p>
                    </div>



                  </div>
                </div>

              </div>
          <?php }
      } ?>

            </div>

            <!--Side-Bar-->
            <aside class="col-md-3">

              <div class="share_vehicle">
                <p>Share: <a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a> </p>
              </div>
              <div class="sidebar_widget">
                <div class="widget_heading">
                  <h5><i class="fa fa-envelope" aria-hidden="true"></i>Book Seat Now</h5>
                </div>
                <form method="post">
                  <div class="form-group">
                    <label>Date:</label>
                    <input type="date" class="form-control" name="fdate" placeholder="Date for ride" required>
                  </div>
                  <div class="form-group">
                    <label>Time:</label>
                    <input type="time" id="appt" class="form-control" name="ftime" placeholder="time for Pick Up" required>
                  </div>
                  <div class="form-group">
                    <textarea rows="4" class="form-control" name="fmessage" placeholder="Please include your route. And the time you will be available for pick up." required></textarea>
                  </div>
                  <?php if ($_SESSION['login']) { ?>
                    <div class="form-group">
                      <input type="submit" class="btn" name="submit" value="Book Now">
                    </div>
                  <?php } else { ?>
                    <a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal" data-dismiss="modal">Login For Book</a>
                    <p>Login before you book</p>

                  <?php } ?>
                </form>
              </div>
            </aside>
            <!--/Side-Bar-->
          </div>

          <div class="space-20"></div>
          <div class="divider"></div>

          <!--Similar-Cars-->
          <div class="similar_cars">
            <h3>Similar Rides</h3>
            <div class="row">
              <?php
              $bid = $_SESSION['brndid'];
              $sql = "SELECT tblvehicles.VehiclesTitle,tblroutes.routename,tblvehicles.price,tblvehicles.freeseats,tblvehicles.drivername,tblvehicles.id,tblvehicles.drivercontacts,tblvehicles.drivermessage,tblvehicles.picktime,tblvehicles.Vimage from tblvehicles join tblroutes on tblroutes.id=tblvehicles.routename where tblvehicles.routename=:bid";
              $query = $dbh->prepare($sql);
              $query->bindParam(':bid', $bid, PDO::PARAM_STR);
              $query->execute();
              $results = $query->fetchAll(PDO::FETCH_OBJ);
              $cnt = 1;
              if ($query->rowCount() > 0) {
                foreach ($results as $result) { ?>
                  <div class="col-md-3 grid_listing">
                    <div class="product-listing-m gray-bg">
                      <div class="product-listing-img"> <a href="vehical-details.php?vhid=<?php echo htmlentities($result->id); ?>"><img src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage); ?>" class="img-responsive" alt="image" /> </a>
                      </div>
                      <div class="product-listing-content">
                        <h5><a href="vehical-details.php?vhid=<?php echo htmlentities($result->id); ?>"><?php echo htmlentities($result->routename); ?> , <?php echo htmlentities($result->VehiclesTitle); ?></a></h5>
                        <p class="list-price">SH.<?php echo htmlentities($result->price); ?></p>

                        <ul class="features_list">

                          <li><i class="fa fa-user" aria-hidden="true"></i><?php echo htmlentities($result->freeseats); ?> Available seats</li>
                          <li><i class="fa fa-calendar" aria-hidden="true"></i><?php echo htmlentities($result->drivername); ?> Driver Name</li>
                          <li><i class="fa fa-calendar" aria-hidden="true"></i><?php echo htmlentities($result->drivercontacs); ?> Driver contact</li>
                          <li><i class="fa fa-car" aria-hidden="true"></i><?php echo htmlentities($result->picktime); ?></li>
                        </ul>
                        <p class="list-price">SH.<?php echo htmlentities($result->drivermessage); ?> Message</p>
                      </div>
                    </div>
                  </div>
              <?php }
              } ?>

            </div>
          </div>
          <!--/Similar-Cars-->

        </div>
      </section>
      <!--/Listing-detail-->

      <!--Footer -->
      <?php include('includes/footer.php'); ?>
      <!-- /Footer-->

      <!--Back to top-->
      <div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
      <!--/Back to top-->

      <!--Login-Form -->
      <?php include('includes/login.php'); ?>
      <!--/Login-Form -->

      <!--Register-Form -->
      <?php include('includes/registration.php'); ?>

      <!--/Register-Form -->

      <!--Forgot-password-Form -->
      <?php include('includes/forgotpassword.php'); ?>

      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/bootstrap.min.js"></script>
      <script src="assets/js/interface.js"></script>
      <script src="assets/switcher/js/switcher.js"></script>
      <script src="assets/js/bootstrap-slider.min.js"></script>
      <script src="assets/js/slick.min.js"></script>
      <script src="assets/js/owl.carousel.min.js"></script>

</body>

</html>