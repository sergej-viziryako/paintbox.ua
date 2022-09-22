<?php
// msFavoriter
// https://github.com/TrywaR/msFavoriter
switch($modx->event->name) {
  case 'OnPageNotFound':
    switch($_GET['q']) {
      case 'msfavoriter':
        //id пользователя
        $user_id = $modx->user->get('id');
        $price = 0;

        if (isset($_POST['id']))
          if (isset($_SESSION['msFavoriter'][$_POST['id']])) {
            //Если товар уже есть, удаление
            unset($_SESSION['msFavoriter'][$_POST['id']]);

            //Удаление товара у юзера из БД
            //$q = $modx->prepare("DELETE FROM user_fav WHERE good_id = '" . $_POST['id'] . "'  AND user_id = '$user_id'");
            //$q->execute();
          } else {
            //Если нет, добавление избранного товара
            $_SESSION['msFavoriter'][$_POST['id']] = $_POST['id'];

            //Добавления товара у юзера из БД
            //$q = $modx->prepare("INSERT INTO `user_fav` (`id`, `user_id`, `good_id`, `date`, `price`) VALUES (null, '$user_id', '" . $_POST['id'] . "', CURRENT_TIMESTAMP,'" . $price . "')");
            //$q->execute();
          }
        else
          // - Получение количества избранных товаров
          if (isset($_SESSION['msFavoriter']))
            echo count($_SESSION['msFavoriter']);
            /*$sql = "SELECT SUM(price) as price_sum  FROM user_fav WHERE user_id = " . $user_id;
            $q = $modx->prepare($sql);
            $q->execute();
            $resources = $q->fetchAll(PDO::FETCH_ASSOC);
            if ($resources[0]['price_sum']) {
              $count = $resources[0]['price_sum'];
            } else {
              $count = ' 0 ';
            }*/
        die();
        break;
    }
}