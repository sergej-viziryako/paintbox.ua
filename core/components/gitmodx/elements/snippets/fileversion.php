<?php
$file_path = MODX_BASE_PATH.$input;
if (file_exists($file_path)) {
    return $input."?".md5_file($file_path);
}
else {
    return $input;
}