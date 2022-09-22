{if $.get.msorder}
  <script>
    window.dataLayer = window.dataLayer || [];
    dataLayer.push ( {
      'ecommerce': {
        'purchase': {
          'actionField': {
            'id': '{$order.num}',
            'revenue': '{$total.cost | replace : " " : ""}',
            'currency':'UAH',
          },
          'products': [

            {foreach $products as $product last=$last}
              {var $idparent = $_modx->runSnippet('!parentProduct',[ 'id'=>"{$product.id}"])}
            {
              'name': ' {$product.pagetitle} ',
              'id': ' {$product.id} ',
              'price': '{$product.price | replace : " " : ""}',
              'category': ' {$idparent | resource : 'pagetitle'} ',
              'quantity': {$product.count},
            } {if !$last},{/if}
              {/foreach}
          ]
        }
      },
      'event': 'checkout',
      'gtm-ee-event-category': 'ecommerce',
      'gtm-ee-event-action': 'Purchase',
      'gtm-ee-event-non-interaction': 'False',
    } );
  </script>
{/if}