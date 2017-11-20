<?php
  include("../model/dbConnect.php");
  include("../model/dbQuery.php");
  include("../control/helper.php");

  $subjectId= Request("subjectId");
  $module = Request("module", "answerMatrix");
  $title = Request("title", "응답 목록");

  $imageOnly = Request("imageOnly", "");

  if (strlen($imageOnly) > 0) {
    $imageOnly = true;
  }
  else {
    $imageOnly = false;
  }


  $modulePath = "../model/".$module.".php";

  if (strlen($subjectId) == 0) {
    $subjectId = -1;
  }

	if ($subjectId == null) {
		$subjectTitle = $title;
	}
	else {
		$subjectTitle = getSubjectTitle($subjectId)." ".$title;
	}
/*
  header("Content-type: application/vnd.ms-excel");
  header("Content-Disposition: attachment; filename=download.xls");
  header("Content-Description: $subjectTitle");
  header("Content-charset=UTF-8");
*/
	header( "Content-type: application/vnd.ms-excel; charset=UTF-8" );
	header( "Content-Disposition: attachment; filename=download.xls" );
	header( "Content-Description: $subjectTitle" );


?>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><?=$subjectTitle ?></title>
	</head>
	<body>
		<?php include($modulePath);?>
	</body>
</html>
