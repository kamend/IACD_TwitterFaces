<? include('config.php'); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/style.css">
	
	<!--[if lt IE 9]>
	    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/processing-1.4.1.min.js"></script>
	<script src="<?=$_socketio;?>"></script>
	<script>
		var socketIoURL = '<?=$_socketurl;?>';
	</script>
	<script src="js/app.js"></script>
<body>
	<div id="content">
	<div id="canvas">
		<canvas id="Processing_canvas" data-processing-sources="js/app.pde">
			<p>Please upgrade your browser to something newer, like <a href="http://chrome.google.com" target="_blank">Google Chrome</a></p>
		</canvas>
	</div>
	
	<!--
	<button id="btnRefresh">Refresh</button>
	<button id="btnTwitter">Force Update</button>
	-->
	</div>
</body>
</html>