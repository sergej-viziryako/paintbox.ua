<?php
if ($modx->context->key != 'mgr') {
  switch ($modx->event->name) {
    // Событие перед регистрацией пользователя
    case 'OnBeforeUserFormSave':
      if ($mode == 'new') {
        if (empty($_POST['fullname'])) {
          $modx->event->output('Вы должны указать имя пользователя');
        } else {
          $user->Profile->set('fullname', $_POST['fullname']);
          $user->Profile->set('mobilephone', $_POST['mobilephone']);
        }
      }
      break;
    // Событие после регистрации пользователя
    case 'OnUserFormSave':
      if ($mode == 'new') {
        // Здесь мы добавляем выбранную группу
        //$user->joinGroup($groups[$_POST['group']]);
        $modx->log(modX::LOG_LEVEL_ERROR, 'New');
        $modx->log(modX::LOG_LEVEL_ERROR, $_POST['fullname']);
      }
      break;
  }
}