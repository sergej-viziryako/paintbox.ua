<?php
if ($filename == '') return 0;

$path = $_SERVER['DOCUMENT_ROOT'].$filename;

if (file_exists($path)) {
  return 1;
} else {
  return 0;
}