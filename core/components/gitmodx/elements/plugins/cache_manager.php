<?php
switch($modx->event->name) {
  case 'OnDocFormSave':

  case 'OnResourceDelete':
    if ($modx->cacheManager instanceof OptCacheManager) {
      switch ($mode){
        case 'upd':
          // Чистим кэш сохраняемого ресурса.
          $modx->cacheManager->clearResourceCache($resource, true);
          //$modx->log(modX::LOG_LEVEL_ERROR, 'Error! Can not open the file: '.$file);
          break;
      }
    }
    // Генерируем кэш автопубликаций.
    $modx->cacheManager->refresh([
      'auto_publish' => ['contexts' => ['web']],
    ]);
    break;
  case 'OnResourceAutoPublish':
    break;
}

if ($modx->cacheManager instanceof OptCacheManager) {
  // Указываем ресурсы, у которых нужно очистить кэш.
  $ids = [1,10];
  foreach ($ids as $id) {
    $modx->cacheManager->clearResourceCache($id, true); // Второй параметр отвечает за генерацию кэша указанной страницы.
  }
}

// Удаляем кэши элементов
/*foreach(['chunks', 'snippets'] as $folder) {
  array_map('unlink', glob(MODX_CORE_PATH . "cache/optimization/$folder/*.php"));
}*/