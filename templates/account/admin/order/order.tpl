<!-- Header -->
{include file="common/header.tpl"}

<!-- Main -->			
<div id="order-page">
  <h1 class="page-title">Encomendas</h1>
  <table class="order-table">
    <tr>
      <th>ID</th>
      <th>Data</th>
      <th>Username</th>
      <th>Endereço</th>
      <th>Produtos</th>
      <th>Estado</th>
      <th>Confirmar / Remover</th>
    </tr>
  {foreach from=$orders item=$order} 
    <tr> 
      <td>{$order.id}</td>
      <td>{$order.order_date}</td>
      <td>{$order.username}</td>
      <td>{$order.address}</td>
      <td>
        <!--FIXME: -->       
        {foreach from=$ordersProducts item=$orderProducts}
          {if ($orderProducts.order_id == $order.id)}
            {foreach from=$orderProducts item=$product}
              {$product.product_id}: {$product.quantity}
              <br>            
            {/foreach}  
          {/if}        
        {/foreach}
      </td>      
      <td>{$order.order_state}</td>
      <td>
        <a href="{$BASE_URL}/actions/admin/order/confirm_order.php?action=confirm&id={$order.id}">
          <i class="fas fa-check-circle" style="color: green"></i>
        </a>
        &nbsp;
        <a href="{$BASE_URL}/actions/admin/order/delete_order.php?action=delete&id={$order.id}">
          <i class="fas fa-trash" style="color: red"></i>
        </a>
      </td>
    </tr>
  {/foreach}  
  </table>

<!-- Footer -->
{include file="common/footer.tpl"}
