<?php
if ($id == '') return;
if ($tv_meta_keywords = $modx->getObject('modTemplateVarResource', array('contentid' => $id, 'tmplvarid' => 79))) {
  return $tv_meta_keywords->get('value');
}