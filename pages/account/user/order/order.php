<?php 
  include_once('../../config/init.php');
  include_once($BASE_DIR . '/database/order.php');
   
  //FIXME:
  if (isset($_SESSION['username'])) {    
    $username = $_SESSION['username'];
    $orders = getUserOrders($username);
    foreach ($orders as $order) {
      $ordersProducts[] = getOrderProducts($order['id']);
    }      
    $smarty->assign('orders', $orders);
    $smarty->assign('ordersProducts', $ordersProducts);
    $smarty->display('account/user/order/order.tpl');

  } else header('Location: '. $BASE_URL);  
?>